//
//  NewsItemView.swift
//  news_swiftUI-combine
//
//  Created by Anna Zharkova on 16.02.2021.
//

import SwiftUI

struct NewsItemRow: View {
    @State var item: NewsItem
    
    var body: some View {
        HStack(alignment: .top) {
            VStack {
                HeaderText(text: item.title ?? "").lineLimit(4)
                SubheaderText(text: item._description ?? "").lineLimit(4)
                DateText(text: item.publishedAt ?? "")
            }
            ThumbImage(url: item.urlToImage ?? "")
        }
    }
}
