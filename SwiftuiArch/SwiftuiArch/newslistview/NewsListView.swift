//
//  NewsListView.swift
//  news_swiftUI-combine
//
//  Created by Anna Zharkova on 16.02.2021.
//

import SwiftUI

protocol INewsListView : IInputView {
    
}

struct NewsListView: View {
     var presenter: INewsListPresenter? = nil
    
    init() {
        presenter = NewsListPresenter()
        presenter?.view = self 
    }
   
    @ObservedObject var model: NewsListModel = NewsListModel()
    @State var isSearchActive: Bool = false
    
    var body: some View {
        NavigationView {
            List(model.newsItems) {item in
                NavigationLink(
                    destination: NewsItemView(item: item)) {
                    NewsItemRow(item: item)
                }
            }.navigationBarTitle("News", displayMode: .inline).navigationBarItems(trailing: NavigationLink(destination:SearchView()){
                Image("search").resizable().frame(width: 20, height: 20, alignment: .topTrailing)
            }).onAppear(){ 
                self.presenter?.loadData()
            }
        }
    }
}

extension NewsListView : INewsListView {
    func updateModel(data: Any?) {
        self.model.update(data: data)
    }
}


struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
    }
}
