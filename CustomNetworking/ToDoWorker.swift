//
//  ToDoWorker.swift
//  CustomNetworking
//
//  Created by Alexey Kiselev on 01.12.2023.
//

import Foundation

enum ToDoEndpoint: Endpoint {
    case toDo(Int)
    
    var compositePath: String{
        switch self{
        case .toDo(let number):
            return "/todos/\(number)"
        }
    }
    
    var headers: HeaderModel { [:] }
}

struct Todo: Codable {
    let userID, id: Int
    let title: String
    let completed: Bool
    
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, completed
    }
}

final class ToDoWorker{
    typealias ToDoResult = (Result<Todo, Error> ) -> Void
    
    private let networking: Networking = Networking(
        baseUrl: "https://jsonplaceholder.typicode.com"
    )
    
    func fetchTodos(completion: @escaping ToDoResult){
        let endpoint = ToDoEndpoint.toDo(1)
        let request = Request(endpoint: endpoint, method: .get)
        networking.executeRequest(with: request){ result in
            switch result{
            case .success(let model):
                if let data = model.data{
                    print(String(data: data, encoding: .utf8))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
