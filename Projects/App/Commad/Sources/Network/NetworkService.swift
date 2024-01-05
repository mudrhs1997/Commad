//
//  NetworkService.swift
//  Commad
//
//  Created by 정명곤 on 2023/09/14.
//

import Foundation
import Combine

enum NetworkError: Error {
    case invalidRequest
    case unknownError(message: String)
}

enum HTTPMethod: String {
    case get
    case post
    case put
    case patch
    case delete
}

final class NetworkService {
    static let shared = NetworkService()
    
    private let baseURL = "http://43.201.132.71:8080"
    
    func buildEndpoint(baseURL: String, endpoint: String) -> URL {
        guard let url = URL(string: baseURL + endpoint) else { return URL(string: "")! }
        
        return url
    }
    
    func buildEndPointWithParams(baseURL: String, endpoint: String, params: [String: Any]) -> URL {
        var urlWithParams = baseURL + endpoint + "?"
        
        params.forEach { (key, value) in
            urlWithParams += "\(key)=\(value)&"
        }

        guard let url = URL(string: String(urlWithParams.dropLast())) else { return URL(string: "")! }
        
        return url
    }
}

extension NetworkService {
    
    func get(to endpoint: Endpoint) -> URLSession.DataTaskPublisher {
        
        let url = buildEndpoint(baseURL: baseURL, endpoint: endpoint.endpoint)
        
        let request = RequestBuilder()
            .url(url: url)
            .method(.get)
            .header()
            .create()
        
        return URLSession(configuration: .default).dataTaskPublisher(for: request)
        
    }
    
    func get(to endpoint: Endpoint, params: [String: Any]) -> URLSession.DataTaskPublisher {
        
        let url = buildEndPointWithParams(baseURL: baseURL, endpoint: endpoint.endpoint, params: params)

        let request = RequestBuilder()
            .url(url: url)
            .method(.get)
            .header()
            .create()
        
        return URLSession(configuration: .default).dataTaskPublisher(for: request)
    }
    
    func post(to endpoint: Endpoint, param: [String: Any]) -> URLSession.DataTaskPublisher {
        
        let url = buildEndpoint(baseURL: baseURL, endpoint: endpoint.endpoint)
        
        let request = RequestBuilder()
            .url(url: url)
            .method(.post)
            .body(param)
            .header()
            .create()
        
        return URLSession(configuration: .default).dataTaskPublisher(for: request)
    }
    
    func delete(to endpoint: Endpoint, param: [String: Any]) -> URLSession.DataTaskPublisher {
        
        let url = buildEndpoint(baseURL: baseURL, endpoint: endpoint.endpoint)
        
        let request = RequestBuilder()
            .url(url: url)
            .method(.delete)
            .body(param)
            .header()
            .create()
        
        return URLSession(configuration: .default).dataTaskPublisher(for: request)
    }
    
    func put() {
        
    }
}

