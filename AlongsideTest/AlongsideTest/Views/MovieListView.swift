//
//  MovieListView.swift
//  AlongsideTest
//
//  Created by Ruchit on 06/10/25.
//


import SwiftUI

struct MovieListView: View {
    @StateObject private var viewModel = MovieListViewModel()
    @State private var isGrid = true
    @State private var searchText = ""

    private let gridColumns = [
        GridItem(.fixed(110), spacing: 12),
        GridItem(.fixed(110), spacing: 12),
        GridItem(.fixed(110), spacing: 12)
    ]

    var filteredMovies: [Movie] {
        if searchText.isEmpty {
            return viewModel.movies
        } else {
            return viewModel.movies.filter {
                $0.title.lowercased().contains(searchText.lowercased())
            }
        }
    }

    var body: some View {
        NavigationView {
            ScrollView {
                if viewModel.isLoading {
                    // ... ProgressView block
                } else if viewModel.errorMessage != nil {
                    // ... Error view block
                } else if !searchText.isEmpty && filteredMovies.isEmpty {
                    VStack(spacing: 12) {
                        Image(systemName: "film")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                            .foregroundColor(.gray)

                        Text("No movies found")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(.top, 100)
                } else {
                    if isGrid {
                        LazyVGrid(columns: gridColumns, spacing: 20) {
                            ForEach(filteredMovies) { movie in
                                NavigationLink(destination: MovieDetailView(movie: movie)) {
                                    MovieCardView(movie: movie)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top, 12)
                    } else {
                        LazyVStack(spacing: 0) {
                            ForEach(filteredMovies) { movie in
                                NavigationLink(destination: MovieDetailView(movie: movie)) {
                                    MovieRowCardView(movie: movie)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding(.top, 12)
                    }
                }
            }
            .refreshable {
                await viewModel.fetchMovies()
            }
            .navigationTitle("Movie Explorer")
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search movies")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isGrid.toggle()
                    }) {
                        Image(systemName: isGrid ? "list.bullet" : "square.grid.2x2")
                            .imageScale(.large)
                    }
                }
            }
        }
        .task {
            await viewModel.fetchMovies()
        }
    }
}
