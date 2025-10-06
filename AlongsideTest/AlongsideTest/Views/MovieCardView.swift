//
//  MovieCardView.swift
//  AlongsideTest
//
//  Created by Ruchit on 06/10/25.
//

import SwiftUI

struct MovieCardView: View {
    let movie: Movie

    var body: some View {
        VStack(spacing: 8) {
            // Poster
            AsyncImage(url: movie.posterURL) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            .frame(width: 110, height: 165)
            .clipped()
            .cornerRadius(12)

            // Title + Year in fixed-size VStack
            VStack(spacing: 4) {
                Text(movie.title)
                    .font(.caption)
                    .multilineTextAlignment(.center)
                    .lineLimit(2) // ✅ Maximum of 2 lines
                    .frame(maxWidth: .infinity, alignment: .center)

                Text(movie.releaseYear)
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
            .frame(width: 110, height: 40) // ✅ Locks text block height
        }
        .frame(width: 110)
        .padding(.top, 8)
    }
}
