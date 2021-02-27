//
//  ThumbImage.swift
//  news_swiftUI-combine
//
//  Created by Anna Zharkova on 16.02.2021.
//

import SwiftUI
import Kingfisher

struct ThumbImage: View {
    var imageUrl: String
    
    init(url: String){
        self.imageUrl = url
    }
    
    var body: some View {
        KFImage.url(URL(string: imageUrl)).loadDiskFileSynchronously().resizable().aspectRatio(contentMode: .fit).frame(width: 150, height: 150, alignment: .center)
    }
}
