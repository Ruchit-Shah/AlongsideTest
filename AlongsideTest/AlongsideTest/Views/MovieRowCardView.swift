//
//  MovieRowCardView.swift
//  AlongsideTest
//
//  Created by Ruchit on 06/10/25.
//


import SwiftUI

struct MovieRowCardView: View {
    let movie: Movie

    var body: some View {
        HStack(spacing: 16) {
            AsyncImage(url: movie.posterURL) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Color.gray.opacity(0.2)
            }
            .frame(width: 100, height: 150)
            .clipped()
            .cornerRadius(12)

            VStack(alignment: .leading, spacing: 6) {
                Text(movie.title)
                    .font(.headline)
                    .lineLimit(2)

                Text(movie.releaseYear)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()
        }
        .padding(.vertical, 6)
        .padding(.horizontal)
        .background(Color(.systemBackground))
    }
}