//
//  NewsItem.swift
//  news_swiftUI-combine
//
//  Created by Anna Zharkova on 16.02.2021.
//

import Foundation

class NewsItem : Codable,Identifiable {
    let uuid = UUID.init()
    
    let author: String?
    let title: String?
    let _description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    
    enum CodingKeys: String, CodingKey {
        case author, title, url, urlToImage, content, publishedAt
        case _description = "description"
    }
}
