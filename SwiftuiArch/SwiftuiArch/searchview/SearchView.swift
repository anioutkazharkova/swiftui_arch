//
//  SearchView.swift
//  news_swiftUI-combine
//
//  Created by Anna Zharkova on 16.02.2021.
//

import SwiftUI

struct SearchView: View {
    @State var text: String = ""
    @ObservedObject var model: SearchModel = SearchModel()
    var body: some View {
        VStack {
            SearchControl(text: $text) { (search) in
                self.model.loadData(query: search)
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

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
