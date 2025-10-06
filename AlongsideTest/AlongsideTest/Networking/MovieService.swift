//
//  MovieService.swift
//  AlongsideTest
//
//  Created by Ruchit on 06/10/25.
//


import Foundation

class MovieService {
    private let url = URL(string: "https://api.themoviedb.org/3/movie/popular")!
    private let token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwNjg0MDQ2M2QzZDI1Zjg5MzNjZjAwYTk3NTNlOWFlMSIsIm5iZiI6MTc0ODM4MzY5MC41MTIsInN1YiI6IjY4MzYzN2NhMzUzNzAxMmEyMjQxNGIxNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.kkRerUQGG_5tolyX-hK0p_c0nLNZYqbXosVrbF3LOa0"
    
    func fetchMovies() async throws -> [Movie] {
        var request = URLRequest(url: url)
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let decoded = try JSONDecoder().decode(MovieResponse.self, from: data)
        LocalCache.shared.saveMovies(decoded.results)
        return decoded.results
    }
}

struct MovieResponse: Codable {
    let results: [Movie]
}
