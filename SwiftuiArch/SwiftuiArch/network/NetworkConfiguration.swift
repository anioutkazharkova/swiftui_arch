//
//  NetworkConfiguration.swift
//  news_swiftUI-combine
//
//  Created by Anna Zharkova on 16.02.2021.
//

import Foundation
protocol  INetworkConfiguration : class {
    func getBaseUrl() -> String
    func getHeaders() -> [String: String] 
    
}

class NetworkConfiguration: INetworkConfiguration {

    private let apiUrl = "https://newsapi.org/v2/"
    private let apiKey = "5b86b7593caa4f009fea285cc74129e2"

    func getHeaders() -> [String: String] {
        return ["X-Api-Key":apiKey]
    }

    func getBaseUrl() -> String {
        return apiUrl
    }

}
