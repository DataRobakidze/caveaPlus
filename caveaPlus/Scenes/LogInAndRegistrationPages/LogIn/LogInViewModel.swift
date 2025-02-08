//
//  LogInViewModel.swift
//  caveaPlus
//
//  Created by Data on 30.01.25.
//

import SwiftUI

class LogInViewModel: ObservableObject {
    @Published var gMail = ""
    @Published var password = ""
    @Published var loginErrorMessage: String?
    @Published var isLoading = false
    
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    
    func authenticateUser() {
        guard !gMail.isEmpty, !password.isEmpty else {
            loginErrorMessage = "გთხოვთ შეიყვანოთ ელ-ფოსტა და პაროლი."
            return
        }
        
        let loginData = LoginCredentials(email: gMail, password: password)
        
        guard let loginUrl = URL(string: "https://cavea.plus/api/v1/auth/login") else { return }
        var request = URLRequest(url: loginUrl)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            request.httpBody = try JSONEncoder().encode(loginData)
        } catch {
            loginErrorMessage = "შეცდომა მონაცემების გაგზავნისას."
            return
        }
        
        isLoading = true
        loginErrorMessage = nil
        
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                if let error = error {
                    self?.loginErrorMessage = "ქსელის შეცდომა: \(error.localizedDescription)"
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    self?.loginErrorMessage = "სერვერის პასუხი ვერ მოიძებნა."
                    return
                }
                
                if httpResponse.statusCode == 200 {
                    self?.isLoggedIn = true
                } else {
                    self?.loginErrorMessage = "ავტორიზაცია ვერ მოხერხდა. შეამოწმეთ მონაცემები."
                }
            }
        }.resume()
    }
}
