//
//  Interactor.swift
//  SwiftuiArch
//
//  Created by Anna Zharkova on 28.02.2021.
//

import Foundation
import Combine

protocol INewsListInteractor : class {
    var presenter: INewsListPresenter? {get set}
    func loadData()
}

class  NewsListInteractor : INewsListInteractor {
    var subscriptions = Set<AnyCancellable>()
    private let service = NetworkService.shared
    private var newsItems = [NewsItem]()
    
    var presenter: INewsListPresenter? = nil
    
    func loadData() {
        let url = "top-headlines?language=en"
        self.presenter?.showLoading()
        _ =  self.service.request(path: url, method: "GET").sink { [weak self] (completion) in
            self?.presenter?.hideLoading()
            switch completion {
            case .failure(let error):
                print(error.localizedDescription)
                self?.presenter?.present(response: .error(error: error.localizedDescription))
            case .finished:
                print("completed")
            }
        } receiveValue: { (list:NewsList) in
            let loaded = list.articles
            self.newsItems = loaded
            self.presenter?.present(response: .success(news: self.newsItems))
        }.store(in: &subscriptions)
    }
}
