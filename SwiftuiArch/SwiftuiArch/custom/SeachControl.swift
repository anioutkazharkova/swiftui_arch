//
//  SeachControl.swift
//  news_swiftUI-combine
//
//  Created by Anna Zharkova on 16.02.2021.
//

import Foundation
import SwiftUI

struct SearchControl : UIViewRepresentable {
    
    @Binding var text: String
    var action: ((String)->Void)?
    
    func makeCoordinator() -> SearchControl.Coordinator {
        let c = Coordinator(text: $text)
        c.action = action
        return c
    }
    
    func makeUIView(context: UIViewRepresentableContext<SearchControl>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context:UIViewRepresentableContext<SearchControl>) {
        uiView.text = text
    }
    
    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String
        var action: ((String)->Void)? = nil
        
        init(text: Binding<String>) {
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
            action?(searchText)
        }
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
            searchBar.endEditing(true)
        }
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searchBar.text = ""
            searchBar.resignFirstResponder()
            searchBar.endEditing(true)
            searchBar.showsCancelButton = false
        }
    }

}

