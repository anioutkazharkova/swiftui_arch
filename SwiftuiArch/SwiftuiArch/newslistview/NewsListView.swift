//
//  NewsListView.swift
//  news_swiftUI-combine
//
//  Created by Anna Zharkova on 16.02.2021.
//

import SwiftUI

protocol INewsListView : IInputView, IModelView {
    var presenter: INewsListPresenter? {get set}
}

struct NewsListView: View {
     var presenter: INewsListPresenter? = nil
    
   
    @ObservedObject var model: NewsListModel = NewsListModel()
    @State var isSearchActive: Bool = false
    
    var body: some View {
            List(model.newsItems) {item in
                NavigationLink(
                    destination: LazyView(NewsItemView(item: item))) {
                    LazyView(NewsItemRow(item: item))
                }
            }.navigationBarTitle("News", displayMode: .inline).navigationBarItems(trailing:  Button(action: {
                Navigator.shared.open(screen: SearchView.self)
            }){
                Image("search").resizable().frame(width: 20, height: 20, alignment: .topTrailing)
            }).onAppear(){ 
                self.presenter?.loadData()
            }
    }
}

extension NewsListView : INewsListView {
    func updateModel(data: Any?) {
        self.model.update(data: data)
    }
    
    var viewModel: IModel? {
        return model
    }
}


struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
    }
}
