//
//  SearchModel.swift
//  news_swiftUI-combine
//
//  Created by Anna Zharkova on 16.02.2021.
//

import Foundation
import Foundation
import SwiftUI
import Combine

class SearchModel : ObservableObject,IModel {
    @Published var newsItems: [NewsItem] = [NewsItem]()
    
    func update(data: Any?) {
        if let data = data as? [NewsItem] {
            self.newsItems = [NewsItem]()
            self.newsItems.append(contentsOf: data)
        }
    }
}
