//
//  Router.swift
//  Movie Viewer
//
//  Created by Nasir Ahmed Khan on 12/11/2023.
//

import Foundation

enum Router {
    case request(endpoint: APIEndpoint)

    var baseURL: String {
        return "https://api.themoviedb.org/3/movie"
    }
    
    var apiKey: String {
        return "528e856ae06f91b07c09a442dbe97a96"
    }

    var method: String {
        switch self {
        case .request:
            return "GET"
        }
    }

    var path: String {
        switch self {
        case .request(let endpoint):
            switch endpoint {
            case .popular:
                return "/popular?api_key=" + apiKey
            case .detail(let movieID):
                return "/\(movieID)?api_key=" + apiKey
            }
        }
    }

    func request() -> URLRequest {
        let url = URL(string: baseURL + path)!
        var request = URLRequest(url: url)
        request.httpMethod = method
        return request
    }
}
