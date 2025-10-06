//
//  MovieDetailView.swift
//  AlongsideTest
//
//  Created by Ruchit on 06/10/25.
//


import SwiftUI

struct MovieDetailView: View {
    let movie: Movie

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let url = movie.posterURL {
                    HStack {
                        Spacer()
                        AsyncImage(url: url) { image in
                            image
                                .resizable()
                                .scaledToFit()
                        } placeholder: {
                            Color.gray.opacity(0.3)
                        }
                        .frame(height: 300)
                        Spacer()
                    }
                }

                Text(movie.title)
                    .font(.title)
                    .multilineTextAlignment(.leading)

                Text("Released: \(movie.releaseYear)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Text(movie.overview)
                    .font(.body)
                    .padding(.top, 8)
            }
            .padding()
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
