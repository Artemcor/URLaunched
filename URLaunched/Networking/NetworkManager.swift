//
//  NetworkManager.swift
//  URLaunched
//
//  Created by Artem Stozhok on 24.04.2023.
//

import Foundation

protocol NetworkSession {
    func loadData(with urlRequest: URLRequest, completionHandler: @escaping (Data?, Error?) -> Void)
}

class NetworkManager {
    private let session: NetworkSession
    
    init(session: NetworkSession = URLSession.shared) {
        self.session = session
    }
    
    func makeRequest<T: Decodable>(
        with url: URL,
        decode decodable: T.Type,
        completionHandler: @escaping (Result<T, Error>) -> Void
    ) {
        session.loadData(with: URLRequest(url: url)) { data, error in
            guard let data = data else {
                completionHandler(.failure(error!))
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                let parsed = try jsonDecoder.decode(decodable, from: data)
                completionHandler(.success(parsed))
            } catch {
                completionHandler(.failure(error))
            }
        }
    }
}

extension URLSession: NetworkSession {
    func loadData(with urlRequest: URLRequest, completionHandler: @escaping (Data?, Error?) -> Void) {
        let task = dataTask(with: urlRequest) { (data, _, error) in
            completionHandler(data, error)
        }
        
        task.resume()
    }
}
