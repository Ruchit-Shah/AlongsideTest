//
//  LocalCache.swift
//  AlongsideTest
//
//  Created by Ruchit on 06/10/25.
//

import Foundation

class LocalCache {
    static let shared = LocalCache()
    private let fileURL: URL = {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent("movies.json")
    }()
    
    func saveMovies(_ movies: [Movie]) {
        if let data = try? JSONEncoder().encode(movies) {
            try? data.write(to: fileURL)
        }
    }
    
    func loadMovies() -> [Movie] {
        guard let data = try? Data(contentsOf: fileURL) else { return [] }
        return (try? JSONDecoder().decode([Movie].self, from: data)) ?? []
    }
}
