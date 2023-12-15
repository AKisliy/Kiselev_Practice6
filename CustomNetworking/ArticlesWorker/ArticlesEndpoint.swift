//
//  ArticlesEndpoint.swift
//  CustomNetworking
//
//  Created by Alexey Kiselev on 15.12.2023.
//

import Foundation

enum ArticlesEndpoint: Endpoint {
    case news(rubricId: Int, page: Int)
    
    var compositePath: String{
        switch self{
        case .news(let rubricId, let pageIndex):
            return "todos/3"
        }
    }
    
    var headers: HeaderModel { [:] }
}
