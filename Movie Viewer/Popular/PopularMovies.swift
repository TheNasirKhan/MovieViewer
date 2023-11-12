//
//  PopularMovies.swift
//  Movie Viewer
//
//  Created by Nasir Ahmed Khan on 12/11/2023.
//

import Foundation

struct PopularMovies: Codable {
    let page: Int
    var results: [Movie]
    let total_pages: Int
    let total_results: Int
}

struct Movie: Codable {
    let adult: Bool
    let backdrop_path: String?
    let genre_ids: [Int]
    let id: Int
    let original_language: String
    let original_title: String
    let overview: String
    let popularity: Double
    let poster_path: String?
    let release_date: String
    let title: String
    let video: Bool
    let vote_average: Double
    let vote_count: Int
}

struct Genre: Codable {
    let id: Int
    let name: String
}
