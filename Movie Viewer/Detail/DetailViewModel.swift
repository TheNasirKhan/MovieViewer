//
//  DetailViewModel.swift
//  Movie Viewer
//
//  Created by Nasir Ahmed Khan on 12/11/2023.
//

import Foundation


class DetailViewModel {
    
    var popularMovie: PopularMovie?
    var movie: Movie?
    
    init(movie: Movie?) {
        self.movie = movie
    }

    func fetchMovie(completion: @escaping () -> Void) {
        guard let movie else { return }
        NetworkManager.shared.request(router: .request(endpoint: .detail(movieID: movie.id))) { (result: Result<PopularMovie, Error>) in
            switch result {
            case .success(let movie):
                self.popularMovie = movie
                CacheManager.shared.saveCachedData(movie, for: .request(endpoint: .detail(movieID: movie.id)))
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
}
