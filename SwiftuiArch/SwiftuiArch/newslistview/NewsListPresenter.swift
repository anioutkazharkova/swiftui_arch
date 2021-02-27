//
//  NewsListPresenter.swift
//  SwiftuiArch
//
//  Created by Anna Zharkova on 28.02.2021.
//

import Foundation
import Combine

protocol INewsListPresenter : class, IPresenter {
    var view: INewsListView? {get set}
    func present(response: NewsListResponse)
}

class NewsListPresenter : INewsListPresenter, IPresenter {
    var view: INewsListView? = nil
    
    func present(response: NewsListResponse) {
        switch response {
        case .success(let news):
            self.view?.updateModel(data: news)
        case .error(let error):
            self.showError(error: error)
        }
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
