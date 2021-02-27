//
//  SearchView.swift
//  news_swiftUI-combine
//
//  Created by Anna Zharkova on 16.02.2021.
//

import SwiftUI

struct SearchView: View {
    @State var text: String = ""
    var body: some View {
        VStack {
            SearchControl(text: $text) { (search) in
              
            }
            List{
                
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
