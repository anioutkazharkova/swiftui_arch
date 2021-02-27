//
//  DataModel.swift
//  SwiftuiArch
//
//  Created by Anna Zharkova on 28.02.2021.
//

import Foundation

enum NewsListResponse {
    case success(news: [NewsItem])
    
    case error(error: String)
}

enum NewsItemResponse {
    case success(news: NewsItem)
    
    case error(error: String)
}

enum SearchResultsResponse {
    case success(news: [NewsItem])
    
    case error(error: String)
}

enum SavedSearchResponse {
    case success(news: [NewsItem])
    
    case error(error: String)
}
