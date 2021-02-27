//
//  NewsListView.swift
//  news_swiftUI-combine
//
//  Created by Anna Zharkova on 16.02.2021.
//

import SwiftUI

struct NewsListView: View {
   
    @ObservedObject var model: NewsListModel = NewsListModel()
    @State var isSearchActive: Bool = false
    
    var body: some View {
        NavigationView {
            List(model.newsItems) {item in
                NavigationLink(
                    destination: LazyView(NewsItemView(item: item))) {
                    LazyView(NewsItemRow(item: item))
                }
            }.navigationBarTitle("News", displayMode: .inline).navigationBarItems(trailing: NavigationLink(destination:SearchView()){
                Image("search").resizable().frame(width: 20, height: 20, alignment: .topTrailing)
            }).onAppear(){ 
                self.model.loadData()
            }
        }
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
    }
}
