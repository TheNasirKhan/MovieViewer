//
//  PopularMovie.swift
//  Movie Viewer
//
//  Created by Nasir Ahmed Khan on 12/11/2023.
//

import Foundation

struct PopularMovie: Codable {
    let adult: Bool
    let backdrop_path: String?
    let belongs_to_collection: Collection?
    let budget: Int
    let genres: [Genre]
    let homepage: String?
    let id: Int
    let imdb_id: String?
    let original_language: String
    let original_title: String
    let overview: String
    let popularity: Double
    let poster_path: String?
    let production_companies: [ProductionCompany]
    let production_countries: [ProductionCountry]
    let release_date: String
    let revenue: Int
    let runtime: Int?
    let spoken_languages: [SpokenLanguage]
    let status: String
    let tagline: String?
    let title: String
    let video: Bool
    let vote_average: Double
    let vote_count: Int
}

struct Collection: Codable {
    let id: Int
    let name: String
    let poster_path: String?
    let backdrop_path: String?
}

struct ProductionCompany: Codable {
    let id: Int
    let logo_path: String?
    let name: String
    let origin_country: String
}

struct ProductionCountry: Codable {
    let iso_3166_1: String
    let name: String
}

struct SpokenLanguage: Codable {
    let english_name: String
    let iso_639_1: String
    let name: String
}
