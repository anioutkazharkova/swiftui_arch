//
//  NewsListVC.swift
//  SwiftuiArch
//
//  Created by Anna Zharkova on 28.02.2021.
//

import Foundation
import UIKit
import SwiftUI
import Combine

protocol NewsListParent: class {
    func showSearch()
}

class NewsListVC : UIHostingController<NewsListView> {
    
    var subscriptions = Set<AnyCancellable>()
    
    private let service = NetworkService()
    private var newsItems: [NewsItem] = [NewsItem]()
  
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    init(){
        super.init(rootView: NewsListView())
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.rootView.parent = self
        self.loadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.rootView.parent = nil
        super.viewWillDisappear(animated)
    }
}

extension NewsListVC : NewsListParent {
    func showSearch() {
        self.navigationController?.pushViewController(SearchVC(), animated: true)
    }
    
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
        self.rootView.updateModel(data: self.newsItems)
        }.store(in: &subscriptions)
    }
}
