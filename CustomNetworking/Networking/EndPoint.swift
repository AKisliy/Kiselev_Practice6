//
//  EndPoint.swift
//  CustomNetworking
//
//  Created by Alexey Kiselev on 01.12.2023.
//

protocol Endpoint{
    var compositePath: String { get }
    var headers: HeaderModel { get }
}
