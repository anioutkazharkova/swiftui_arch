//
//  SearchPresenter.swift
//  SwiftuiArch
//
//  Created by Anna Zharkova on 28.02.2021.
//

import Foundation
import Combine

protocol ISearchPresenter : class {
    var view: ISearchView? {get set}
    
    func loadData(query: String)
}

class SearchPresenter : ISearchPresenter, IPresenter {
    var subscriptions = Set<AnyCancellable>()
    private let service = NetworkService.shared
    
    private var newsItems: [NewsItem] = [NewsItem]()
    var view: ISearchView? = nil
    
    func loadData(query: String) {
        let url = "everything?q=\(query)"
        self.showLoading()
        _ =  self.service.request(path: url, method: "GET").sink { [weak self] (completion) in
            guard let self = self else {return}
            self.hideLoading()
            switch completion {
            case .failure(let error):
                print(error.localizedDescription)
                self.view?.showError(error: error.localizedDescription)
            case .finished:
                print("completed")
            }
        } receiveValue: { (list:NewsList) in
            let loaded = list.articles
            self.newsItems = loaded
            self.view?.updateModel(data: self.newsItems)
        }.store(in: &subscriptions)
    }
    
    func showError(error: String) {
        self.view?.showError(error: error)
    }
    
    func showLoading() {
        self.view?.showLoading()
    }
    
    func hideLoading() {
        self.view?.hideLoading()
    }
}
