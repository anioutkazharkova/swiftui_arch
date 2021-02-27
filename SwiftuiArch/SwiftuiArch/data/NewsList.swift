//
//  NewsList.swift
//  news_swiftUI-combine
//
//  Created by Anna Zharkova on 16.02.2021.
//

import Foundation

class NewsList : Codable,Identifiable {
    let articles: [NewsItem]
    
    enum CodingKeys: String, CodingKey {
        case articles = "articles"
    }
}
