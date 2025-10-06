//
//  Movie.swift
//  AlongsideTest
//
//  Created by Ruchit on 06/10/25.
//


import Foundation

struct Movie: Identifiable, Codable {
    let id: Int
    let title: String
    let release_date: String
    let overview: String
    let poster_path: String?
    
    var releaseYear: String {
        return String(release_date.prefix(4))
    }
    
    var posterURL: URL? {
        guard let path = poster_path else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w500" + path)
    }
}
