//
//  ArticlesWorker.swift
//  CustomNetworking
//
//  Created by Alexey Kiselev on 15.12.2023.
//

import Foundation

final class ArticlesWorker {
    private enum Constants{
        static let baseUrl: String = "https://jsonplaceholder.typicode.com/"
    }
    
    private let networking: NetworkingProtocol
    
    init(networking: NetworkingProtocol = Networking(baseUrl: Constants.baseUrl )) {
        self.networking = networking
    }
    
    func fetchNews(page: Int, completion: ((ArticlesModel?) -> Void)?) {
        let endpoint = ArticlesEndpoint.news(rubricId: 4, page: page)
        fetch(endpoint: endpoint, completion: completion)
    }
    
    private func fetch<Decoded: Decodable>(endpoint: Endpoint, completion: ((Decoded?) -> Void)?) {
        let request = Request(endpoint: endpoint)
        networking.executeRequest(with: request){ rawResult in
            guard
                case let .success(result) = rawResult,
                let data = result.data,
                let decoded = try? JSONDecoder().decode(Decoded.self, from: data) // to get nil instead of exception we use try?
            else{
                completion?(nil)
                return
            }
            completion?(decoded)
        }
    }
}
