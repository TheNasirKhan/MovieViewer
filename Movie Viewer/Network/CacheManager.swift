//
//  CacheManager.swift
//  Movie Viewer
//
//  Created by Nasir Ahmed Khan on 12/11/2023.
//

import Foundation

class CacheManager {
    static let shared = CacheManager()

    func saveCachedData<T: Codable>(_ data: T, for router: Router) {
        let key = cacheKey(for: router)
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(data) {
            UserDefaults.standard.set(encodedData, forKey: key)
        }
    }

    func loadCachedData<T: Codable>(for router: Router) -> T? {
        let key = cacheKey(for: router)
        if let cachedData = UserDefaults.standard.data(forKey: key) {
            let decoder = JSONDecoder()
            return try? decoder.decode(T.self, from: cachedData)
        }
        return nil
    }

    private func cacheKey(for router: Router) -> String {
        return "\(router.path)-cachedData"
    }
}
