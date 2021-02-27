//
//  SearchVC.swift
//  SwiftuiArch
//
//  Created by Anna Zharkova on 28.02.2021.
//

import Foundation
import UIKit
import Combine
import SwiftUI


class SearchVC : UIHostingController<SearchView> {
    var subscriptions = Set<AnyCancellable>()
    
    private let service = NetworkService()
    var newsItems: [NewsItem] = [NewsItem]()
    
    private var currentView: SearchView {
        return self.rootView
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init() {
        super.init(rootView: SearchView())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.rootView.searchListener = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.rootView.searchListener = nil
        super.viewWillDisappear(animated)
    }
    
}

extension SearchVC: SearchListener {
    func query(text: String) {
        self.loadData(query: text)
    }
    
    func loadData(query: String) {
        let url = "everything?q=\(query)"
      _ =  self.service.request(path: url, method: "GET").sink { [weak self] (completion) in
        guard let self = self else {return}
        switch completion {
        case .failure(let error):
            print(error.localizedDescription)
        case .finished:
            print("completed")
        }
      } receiveValue: { (list:NewsList) in
        let loaded = list.articles
        self.newsItems = loaded
        self.rootView.updateModel(data: self.newsItems)
        }.store(in: &subscriptions)
    }
}
