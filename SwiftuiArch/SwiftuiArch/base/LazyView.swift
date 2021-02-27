//
//  LazyView.swift
//  SwiftuiArch
//
//  Created by Anna Zharkova on 28.02.2021.
//

import Foundation
import SwiftUI

struct LazyView<Content:View>: View {
    let build: ()->Content
    
    init(_ build: @autoclosure @escaping()->Content) {
        self.build = build
    }
    
    var body: some View {
        build()
    }
}
