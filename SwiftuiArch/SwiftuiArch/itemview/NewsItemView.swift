//
//  NewsItemView.swift
//  news_swiftUI-combine
//
//  Created by Anna Zharkova on 16.02.2021.
//

import SwiftUI

struct NewsItemView: View {
    @State var item: NewsItem
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
            CachedImage(url: item.urlToImage ?? "")
                VStack(alignment: .leading, spacing: 10) {
            Text(item.title ?? "").font(.system(size: 22))
            Text(item.publishedAt ?? "").font(.system(size: 12))
            Text(item.content ?? "").font(.system(size: 18))
                }.padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
        }
        }
    }
}
