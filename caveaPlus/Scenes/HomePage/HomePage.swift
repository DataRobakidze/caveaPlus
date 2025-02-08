//
//  HomePage.swift
//  caveaPlus
//
//  Created by Data on 17.01.25.
//

import SwiftUI

//struct HomePage: View {
//    @StateObject var viewModel = ViewModelOfHomePage()
//    
//    let gridItems = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
//
//    var body: some View {
//        NavigationStack {
//            ScrollView {
//                VStack(alignment: .leading, spacing: 20) {
//                    ForEach(viewModel.itemsList) { item in
//                        SectionView(item: item, gridItems: gridItems)
//                    }
//                }
//                .padding()
//            }
//            .background(Color("MainBackgroundColor").edgesIgnoringSafeArea(.all))
//            .onAppear {
//                viewModel.fetchMovieList()
//            }
//        }
//    }
//}

//struct SectionView: View {
//    let item: Items
//    let gridItems: [GridItem]
//
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text(item.title)
//                .font(.title2)
//                .bold()
//                .foregroundColor(.white)
//                .padding(.leading)
//
//            ScrollView(.horizontal, showsIndicators: false) {
//                LazyHGrid(rows: gridItems, spacing: 10) {
//                    ForEach(item.movies, id: \.id) { movie in
//                        NavigationLink(destination: MovieDetailView(movie: movie)
//                            .navigationBarHidden(true)
//                            .statusBarHidden(true)
//                        ) {
//                            MovieCell(movie: movie)
//                        }
//                        .buttonStyle(PlainButtonStyle())
//                    }
//                }
//                .padding(.horizontal)
//            }
//        }
//    }
//}


struct HomePage: View {
    @StateObject var viewModel = ViewModelOfHomePage()
    
    var body: some View {
            
            List {
                ForEach(viewModel.itemsList) { item in
                    Section(header: Text(item.title)
                        .foregroundStyle(.white)
                        .font(.system(size: 20))
                        .bold()
                    ) {
                        ForEach(item.movies, id: \.id) { movie in
                            Text(movie.name)
                                .font(.system(size: 15))
                            
                        }
                    }
                }
            }
//            .listStyle(.inset)
            .scrollContentBackground(.hidden)
            .background(Color("MainBackgroundColor").edgesIgnoringSafeArea(.all))
            .onAppear {
                viewModel.fetchMovieList()
            }
        
    }
}


#Preview {
    HomePage()
}
