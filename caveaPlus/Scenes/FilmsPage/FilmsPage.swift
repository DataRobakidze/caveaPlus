//
//  FilmsPage.swift
//  caveaPlus
//
//  Created by Data on 17.01.25.
//

import SwiftUI

struct FilmsPage: View {
    @StateObject var viewModel = ViewModelOfFilmsPage()

    let gridItems = Array(repeating: GridItem(.flexible(), spacing: 0), count: 3)

    var body: some View {
        NavigationStack {
            ScrollView {
//                VStack {
//                    // ენის არჩევა
//                    HStack {
//                        Button("ყველა სერიალი") {
//                            viewModel.changeLanguage(to: "ka")  // ქართული ენა
//                        }
//                        .padding()
//                        
//                        Button("ქართული") {
//                            viewModel.changeLanguage(to: "en")  // ინგლისური ენა
//                        }
//                        .padding()
//                    }
//                }
                LazyVGrid(columns: gridItems, spacing: 0) {
                    ForEach(viewModel.movies) { movie in
                        NavigationLink(destination: MovieDetailView(movie: movie)
                            .navigationBarHidden(true)
                            .statusBarHidden(true)
                        ) {
                            MovieCell(movie: movie)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .simultaneousGesture(TapGesture().onEnded {
                            viewModel.impactFeedback()
                        })
                    }
                }
            }
            .padding([.top, .leading, .trailing])
            .background(Color("MainBackgroundColor"))
            .scrollIndicators(.hidden)
            .refreshable {
                await viewModel.refreshTasks()
            }
            .onAppear {
                viewModel.fetchMovieList()
            }
        }
    }
}

// MovieCell view to handle individual movie item
struct MovieCell: View {
    var movie: Movie
    var movieOfHomePage: MovieSection?

    var body: some View {
        VStack {
            ZStack {
                MoviePoster(posterURLString: movie.poster)
                VStack {
                    if let labelName = movie.label?.name, !labelName.isEmpty {
                        LabelName(title: labelName)
                    }
                    Spacer()
                    MovieTitle(title: movie.name)
                }
            }
            Spacer()
        }
        .frame(width: 120, height: 175)
        .cornerRadius(16)
        .shadow(radius: 5)
    }
}

// MovieCell view to handle individual movie item
//struct MovieCellOfHomePage: View {
//    var movieOfHomePage: MovieSection?
//
//    var body: some View {
//        VStack {
//            ZStack {
//                MoviePoster(posterURLString: movieOfHomePage.poster)
//                VStack {
//                    if let labelName = movieOfHomePage.label?.name, !labelName.isEmpty {
//                        LabelName(title: labelName)
//                    }
//                    Spacer()
//                    MovieTitle(title: movieOfHomePage.name)
//                }
//            }
//            Spacer()
//        }
//        .frame(width: 120, height: 175)
//        .cornerRadius(16)
//        .shadow(radius: 5)
//    }
//}

// MoviePoster view to handle the image loading
struct MoviePoster: View {
    var posterURLString: String?

    // Constants for dimensions to avoid magic numbers
    private let posterWidth: CGFloat = 120
    private let posterHeight: CGFloat = 175

    var body: some View {
        if let posterURLString = posterURLString,
           let posterURL = URL(string: "https://cavea.plus\(posterURLString)") {
            AsyncImage(url: posterURL) { phase in
                switch phase {
                case .empty:
                    Rectangle()
                        .foregroundStyle(.gray)
                        .frame(width: posterWidth, height: posterHeight)
                        .cornerRadius(13)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: posterWidth, height: posterHeight)
                        .cornerRadius(13)
                        .clipped()
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: posterWidth, height: posterHeight)
                        .cornerRadius(13)
                        .clipped()
                @unknown default:
                    EmptyView()
                }
            }
        }
    }
}

// MovieTitle view to handle the title display
struct MovieTitle: View {
    var title: String

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.black)
                .opacity(0.5)
                .frame(height: 27)
            Text(title)
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .font(.system(size: 12))
                .bold()
                .lineLimit(1)
                .frame(maxWidth: 110, alignment: .leading)
        }
    }
}

struct LabelName: View {
    var title: String

    var body: some View {
        ZStack {
            Rectangle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [Color("LabelNameLeftColor"), Color("LabelNameRightColor")]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .frame(height: 25)
                .clipShape(
                    .rect(
                        topLeadingRadius: 0,
                        bottomLeadingRadius: 0,
                        bottomTrailingRadius: 14,
                        topTrailingRadius: 0
                    )
                )
                .padding(.trailing, 35)
            Text(title)
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .font(.system(size: 12))
                .lineLimit(1)
                .frame(maxWidth: 105, alignment: .leading)
        }
    }
}


#Preview {
    FilmsPage()
}
