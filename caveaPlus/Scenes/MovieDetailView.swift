//
//  MovieDetailView.swift
//  caveaPlus
//
//  Created by Data on 29.01.25.
//

import AVKit
import SwiftUI

struct MovieDetailView: View {
    var movie: Movie
    
    let videoURL = URL(string: "https://cavea.plus/static/trailers/twin_peaks.mp4")!
    
    @State private var showPlayer = false // Track if the video should be shown
    @State private var player = AVPlayer()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Movie Poster
                ZStack {
                    if let posterURL = URL(string: "https://cavea.plus\(movie.poster)") {
                        AsyncImage(url: posterURL) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: UIScreen.main.bounds.width, height: 600)
                                .clipped()
                                .padding(.top, -82)
                        } placeholder: {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle())
                                .frame(width: 100, height: 145.92)
                        }
                    }
                    
                    Rectangle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [Color("MainBackgroundColor"), .clear]),
                                startPoint: .bottom,
                                endPoint: .top
                            )
                        )
                    
                    VStack {
                        Spacer()
                        
                        HStack {
                            Text(movie.name)
                                .foregroundColor(.white)
                                .font(.system(size: 30))
                                .font(.system(.body, design: .rounded))
                                .fontWeight(.heavy)
                                .frame(alignment: .leading)
                                .padding()
                            Spacer()
                        }
                    }
                }

                // Trailer Section
                VStack {
                    Text("Watch Trailer")
                        .font(.title)
                        .padding()

                    Button(action: {
                        showPlayer.toggle()
                        if showPlayer {
                            player.replaceCurrentItem(with: AVPlayerItem(url: videoURL))
                            player.play()
                        } else {
                            player.pause()
                        }
                    }) {
                        Text(showPlayer ? "Hide Trailer" : "Play Trailer")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
                
                if showPlayer {
                    VideoPlayer(player: player)
                        .frame(height: 300)
                        .onDisappear {
                            player.pause()
                        }
                }
                
                Spacer()
            }
            .padding()
        }
        .background(Color("MainBackgroundColor"))
    }
}

struct VideoPlayerView: View {
    var videoURL: URL
    
    @State private var player = AVPlayer()
    
    var body: some View {
        VStack {
            if let _ = try? Data(contentsOf: videoURL) {
                VideoPlayer(player: player)
                    .onAppear {
                        player = AVPlayer(url: videoURL)
                        player.play()
                    }
                    .frame(height: 300)
            } else {
                Text("Failed to load video.")
                    .foregroundColor(.red)
            }
        }
    }
}


#Preview {
    MovieDetailView(movie: Movie(id: "1", name: "დედა-შვილი ან ღამე არ არის არასოდეს ბოლომდე ბნელი", poster: "/static/images/thumbnails/173701785668455.jpg"))
}
