//
//  NewsListPresenter.swift
//  SwiftuiArch
//
//  Created by Anna Zharkova on 28.02.2021.
//

import Foundation
import Combine

protocol INewsListPresenter : class {
    var view: INewsListView? {get set}
    func loadData()
}

class NewsListPresenter : INewsListPresenter {
    var subscriptions = Set<AnyCancellable>()
    private let service = NetworkService.shared
    private var newsItems = [NewsItem]()
    
    var view: INewsListView? = nil
    
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
            self.view?.updateModel(data: self.newsItems)
        }.store(in: &subscriptions)
    }
}
