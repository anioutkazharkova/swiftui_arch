//
//  NewsListView.swift
//  news_swiftUI-combine
//
//  Created by Anna Zharkova on 16.02.2021.
//

import SwiftUI

struct NewsListView: View {
    @State var isSearchActive: Bool = false
    
    var body: some View {
        NavigationView {
            List{
            }.navigationBarTitle("News", displayMode: .inline).navigationBarItems(trailing: NavigationLink(destination:SearchView()){
                Image("search").resizable()
                    .frame(width: 20, height: 20,
                           alignment: .topTrailing)
            })
        }
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
    }
}
