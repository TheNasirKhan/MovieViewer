//
//  NetworkManager.swift
//  Movie Viewer
//
//  Created by Nasir Ahmed Khan on 12/11/2023.
//

import Foundation

enum NetworkError: Error {
    case noInternetAndNoCache
}

class NetworkManager {
    static let shared = NetworkManager()
    
    var imageBaseURL = "https://image.tmdb.org/t/p/original"

    func request<T: Codable>(router: Router, completion: @escaping (Result<T, Error>) -> Void) {
        if isInternetAvailable() {
            URLSession.shared.dataTask(with: router.request()) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }

                if let data = data {
                    do {
                        let decodedData = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(decodedData))
                    } catch {
                        completion(.failure(error))
                    }
                }
            }.resume()
        } else {
            if let cachedData = CacheManager.shared.loadCachedData(for: router) as T? {
                completion(.success(cachedData))
            } else {
                completion(.failure(NetworkError.noInternetAndNoCache))
            }
        }
    }

    private func isInternetAvailable() -> Bool {
        return ConnectionManager.shared.hasConnectivity()
    }
}
