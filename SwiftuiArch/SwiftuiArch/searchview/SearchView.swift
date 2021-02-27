//
//  SearchView.swift
//  news_swiftUI-combine
//
//  Created by Anna Zharkova on 16.02.2021.
//

import SwiftUI

protocol ISearchView : IInputView {
    
}

struct SearchView: View {
    @State var text: String = ""
    @ObservedObject var model: SearchModel = SearchModel()
    
    var presenter: ISearchPresenter? = nil
   
   init() {
       presenter = SearchPresenter()
       presenter?.view = self
   }
    
    var body: some View {
        VStack {
            SearchControl(text: $text) { (search) in
                self.presenter?.loadData(query: search)
            }
            List(model.newsItems, id: \.uuid) {item in
                NavigationLink(
                    destination: NewsItemView(item: item)) {
                    NewsItemRow(item: item)
                }
            }
        }
    }
}

extension SearchView : ISearchView {
    func updateModel(data: Any?) {
        self.model.update(data: data)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
