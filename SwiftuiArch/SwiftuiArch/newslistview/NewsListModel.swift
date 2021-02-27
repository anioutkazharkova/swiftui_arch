//
//  NewsListModel.swift
//  news_swiftUI-combine
//
//  Created by Anna Zharkova on 16.02.2021.
//

import Foundation
import SwiftUI
import Combine

class NewsListModel : ObservableObject {
    var subscriptions = Set<AnyCancellable>()
    
    private let service = NetworkService()
    @Published var newsItems: [NewsItem] = [NewsItem]()
    
    func loadData() {
        let url = "top-headlines?language=en"
      _ =  self.service.request(path: url, method: "GET").sink { [weak self] (completion) in
        switch completion {
        case .failure(let error):
            print(error.localizedDescription)
        case .finished:
            print("completed")
        }
      } receiveValue: { (list:NewsList) in
        let loaded = list.articles
        self.newsItems = loaded
        }.store(in: &subscriptions)

        
    }
    
}
