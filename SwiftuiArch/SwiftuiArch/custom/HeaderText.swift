//
//  HeaderText.swift
//  news_swiftUI-combine
//
//  Created by Anna Zharkova on 16.02.2021.
//

import SwiftUI

struct HeaderText: View {
    @State var text: String
    var body: some View {
        Text(text).font(.system(size: 16)).bold()
    }
}

