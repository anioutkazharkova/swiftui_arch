//
//  NewsListView.swift
//  news_swiftUI-combine
//
//  Created by Anna Zharkova on 16.02.2021.
//

import SwiftUI

protocol INewsListView: IInputView {
}

struct NewsListView: View {
   
    @ObservedObject var model: NewsListModel = NewsListModel()
    @State var isSearchActive: Bool = false
    
    weak var parent: NewsListParent? = nil
    
    var body: some View {
            List(model.newsItems) {item in
                NavigationLink(
                    destination: NewsItemView(item: item)) {
                    NewsItemRow(item: item)
                }
                .accessibilityElement()
            }.navigationBarTitle("News", displayMode: .inline).navigationBarItems(trailing: Button(action: {
                self.parent?.showSearch()
            }){
                Image("search").resizable().frame(width: 20, height: 20, alignment: .topTrailing)
            })
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
