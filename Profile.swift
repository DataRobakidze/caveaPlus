//
//  Profile.swift
//  caveaPlus
//
//  Created by Data on 30.01.25.
//

import SwiftUI

struct UserProfile: Decodable {
    var id: String
    var name: String
    var email: String
    var profileImageUrl: String?

    enum CodingKeys: String, CodingKey {
        case id, name, email
        case profileImageUrl = "profile_image_url" // Ensure this matches API response
    }
}

struct Profile: View {
    @State private var userProfile: UserProfile?
    @State private var isLoading = false
    @State private var errorMessage: String?

    var body: some View {
        VStack {
            if isLoading {
                ProgressView("Loading...")
                    .progressViewStyle(CircularProgressViewStyle())
            } else if let userProfile = userProfile {
                VStack {
                    if let imageUrl = userProfile.profileImageUrl, let url = URL(string: imageUrl) {
                        AsyncImage(url: url) { image in
                            image.resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                        } placeholder: {
                            Circle().fill(Color.gray)
                                .frame(width: 100, height: 100)
                        }
                    }

                    Text(userProfile.name)
                        .font(.largeTitle)
                        .bold()
                        .padding(.top)

                    Text(userProfile.email)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.top, 2)
                }
                .padding()
            } else if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .onAppear {
            fetchUserProfile()
        }
        .background(Color("MainBackgroundColor"))
    }

    func fetchUserProfile() {
        isLoading = true
        errorMessage = nil

        let profileUrl = URL(string: "https://cavea.plus/api/v1/user/profile")!
        var request = URLRequest(url: profileUrl)
        request.httpMethod = "GET"

        if let token = UserDefaults.standard.string(forKey: "auth_token") {
            print("Auth Token: \(token)")
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        } else {
            print("No auth token found")
            errorMessage = "Authentication token missing."
            isLoading = false
            return
        }

        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                isLoading = false

                if let error = error {
                    errorMessage = "Error: \(error.localizedDescription)"
                    return
                }

                guard let httpResponse = response as? HTTPURLResponse else {
                    errorMessage = "Invalid response from server."
                    return
                }

                print("HTTP Status Code: \(httpResponse.statusCode)")
                guard httpResponse.statusCode == 200 else {
                    errorMessage = "Server error: \(httpResponse.statusCode)"
                    return
                }

                guard let data = data else {
                    errorMessage = "No data received."
                    return
                }

                if let jsonString = String(data: data, encoding: .utf8) {
                    print("Raw JSON Response: \(jsonString)")
                }

                do {
                    let decodedProfile = try JSONDecoder().decode(UserProfile.self, from: data)
                    userProfile = decodedProfile
                } catch {
                    errorMessage = "Decoding error: \(error.localizedDescription)"
                    print("Decoding error: \(error)")
                }
            }
        }.resume()
    }
}

#Preview {
    Profile()
}
