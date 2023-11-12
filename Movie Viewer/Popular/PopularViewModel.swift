//
//  PopularViewModel.swift
//  Movie Viewer
//
//  Created by Nasir Ahmed Khan on 12/11/2023.
//

import Foundation

class PopularViewModel {
    var popularMovies: PopularMovies?
    var sortedMovies: PopularMovies?
    
    init() {}

    func fetchMovies(completion: @escaping () -> Void) {
        NetworkManager.shared.request(router: .request(endpoint: .popular)) { (result: Result<PopularMovies, Error>) in
            switch result {
            case .success(let movies):
                self.popularMovies = movies
                self.sortedMovies = movies
                CacheManager.shared.saveCachedData(movies, for: .request(endpoint: .popular))
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
}
