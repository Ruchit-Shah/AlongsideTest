//
//  MovieListViewModel.swift
//  AlongsideTest
//
//  Created by Ruchit on 06/10/25.
//


import Foundation
import Combine

@MainActor
class MovieListViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil

    func fetchMovies() async {
        isLoading = true
        errorMessage = nil
        do {
            movies = try await MovieService().fetchMovies()
        } catch {
            errorMessage = "Failed to load movies: \\(error.localizedDescription)"
        }
        isLoading = false
    }
}
