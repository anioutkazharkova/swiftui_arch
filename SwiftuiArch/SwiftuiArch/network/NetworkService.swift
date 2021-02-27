//
//  NetworkService.swift
//  news_swiftUI-combine
//
//  Created by Anna Zharkova on 16.02.2021.
//

import Foundation
import Combine

class NetworkService {
    static let shared = NetworkService()
    lazy var urlSession: URLSession? = {
        return URLSession(configuration: .default)
    }()
    
    private let config: INetworkConfiguration = NetworkConfiguration()
    
    var dataTask: URLSessionDataTask? = nil
    
    func request<T:Codable>(path: String, method: String, _ type: T.Type = T.self) -> AnyPublisher<T,Error> {
        let apiUrl = "\(self.config.getBaseUrl())\(path)"
        guard  let url = URL(string: apiUrl) else {
            return Result<T,Error>.Publisher(ErrorResponse(type: .network)).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        let headers = self.config.getHeaders()
        for header in headers.keys {
            if let value = headers[header] {
                request.addValue(value, forHTTPHeaderField: header)
            }
        }
        let task = URLSession.shared.dataTaskPublisher(for: request).tryMap({ (data, response) -> T in
            if let response = response as? HTTPURLResponse {
                let result = ContentResponse<T>(response: response, data: data)
                if let content = result.content {
                    return content
                } else {
                    if let er = result.error {
                        throw er
                    }
                }
            }
            throw ErrorResponse(type: .network)
        }).mapError({ (error) -> Error in
            return error
        })
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
        
        return task
        
    }
}
