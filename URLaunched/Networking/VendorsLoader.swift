//
//  VendorsLoader.swift
//  URLaunched
//
//  Created by Artem Stozhok on 24.04.2023.
//

import Foundation

struct VendorsLoader {
    static func fetchUsers(manager: NetworkManager = NetworkManager(),
                           completion: @escaping (Result<[Vendor], Error>) -> Void) {
        guard let url = URL(string: "https://api.com") else { return }
        
        manager.makeRequest(with: url, decode: Vendors.self) { response in
            switch response {
            case let .success(data):
                completion(.success(data.vendors))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
