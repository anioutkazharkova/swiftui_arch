//
//  SearchView.swift
//  news_swiftUI-combine
//
//  Created by Anna Zharkova on 16.02.2021.
//

import SwiftUI

protocol ISearchView : IInputView,IModelView {
    var presenter: ISearchPresenter? {get set}
}

struct SearchView: View {
    @State var text: String = ""
    @ObservedObject var model: SearchModel = SearchModel()
    
    var presenter: ISearchPresenter? = nil
    
    var body: some View {
        VStack {
            SearchControl(text: $text) { (search) in
                self.presenter?.loadData(query: search)
            }
            List(model.newsItems) {item in
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
    
    var viewModel: IModel? {
        return model
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
