//
//  CachedImage.swift
//  news_swiftUI-combine
//
//  Created by Anna Zharkova on 16.02.2021.
//

import Foundation
import SwiftUI
import Kingfisher

struct CachedImage: View {
    var imageUrl: String
    
    init(url: String){
        self.imageUrl = url
    }
    
    var body: some View {
        KFImage.url(URL(string: imageUrl)).resizable().aspectRatio(contentMode: .fill)
    }
}


