//
//  ModuleConfig.swift
//  SwiftuiArch
//
//  Created by Anna Zharkova on 28.02.2021.
//

import Foundation
import Foundation
import UIKit
import SwiftUI

protocol IConfugator: class {
    func createScreen(_ data: Any?)->UIViewController
}

class ModuleConfig{
    private init(){}
    static let shared = ModuleConfig()
    
    func config<Content:View>(screen: Content.Type)->IConfugator? {
        if screen == NewsListView.self {
            return NewsListConfigurator()
        }
        if screen == NewsItemView.self {
            return NewsItemConfigurator()
        }
        if screen == SearchView.self {
            return SearchConfigurator()
        }
        return nil
    }
}
