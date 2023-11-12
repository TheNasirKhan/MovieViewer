//
//  MockData.swift
//  Movie ViewerTests
//
//  Created by Nasir Ahmed Khan on 12/11/2023.
//

import Foundation
@testable import Movie_Viewer

struct MockData {
    static var mockMovie: Movie {
        return Movie(adult: false, backdrop_path: "/628Dep6AxEtDxjZoGP78TsOxYbK.jpg", genre_ids: [28,53], id: 575264, original_language: "en", original_title: "Mission: Impossible - Dead Reckoning Part One", overview: "Ethan Hunt and his IMF team embark on their most dangerous mission yet: To track down a terrifying new weapon that threatens all of humanity before it falls into the wrong hands. With control of the future and the world's fate at stake and dark forces from Ethan's past closing in, a deadly race around the globe begins. Confronted by a mysterious, all-powerful enemy, Ethan must consider that nothing can matter more than his mission—not even the lives of those he cares about most.", popularity: 2820.303, poster_path: "/NNxYkU70HPurnNCSiCjYAmacwm.jpg", release_date: "2023-07-08", title: "Mission: Impossible - Dead Reckoning Part One", video: false, vote_average: 7.658, vote_count: 2234)
    }

    static var mockPopularMovie: PopularMovie {
        return PopularMovie(
            adult: false,
            backdrop_path: "backdrop.jpg",
            belongs_to_collection: Collection(id: 1, name: "Sample Collection", poster_path: "collection.jpg", backdrop_path: "collection_backdrop.jpg"),
            budget: 1000000,
            genres: [Genre(id: 1, name: "Action"), Genre(id: 2, name: "Drama")],
            homepage: "https://example.com",
            id: 12345,
            imdb_id: "tt123456",
            original_language: "en",
            original_title: "Sample Movie",
            overview: "This is a sample movie overview.",
            popularity: 7.8,
            poster_path: "poster.jpg",
            production_companies: [ProductionCompany(id: 1, logo_path: "company_logo.jpg", name: "Sample Company", origin_country: "US")],
            production_countries: [ProductionCountry(iso_3166_1: "US", name: "United States")],
            release_date: "2023-01-01",
            revenue: 2000000,
            runtime: 120,
            spoken_languages: [SpokenLanguage(english_name: "English", iso_639_1: "en", name: "English")],
            status: "Released",
            tagline: "A sample tagline",
            title: "Sample Movie",
            video: false,
            vote_average: 7.5,
            vote_count: 100
        )
    }
}
