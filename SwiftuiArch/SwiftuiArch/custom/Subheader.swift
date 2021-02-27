//
//  Subheader.swift
//  news_swiftUI-combine
//
//  Created by Anna Zharkova on 16.02.2021.
//

import Foundation
import SwiftUI

struct SubheaderText: View {
    @State var text: String
    var body: some View {
        Text(text).font(.system(size: 14)).foregroundColor(.gray)
    }
}

struct DateText: View {
    @State var text: String
    var body: some View {
        Text(text).font(.system(size: 10)).foregroundColor(.red)
    }
}


