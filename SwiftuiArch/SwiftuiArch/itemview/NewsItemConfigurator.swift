//
//  NewsItemConfigurator.swift
//  SwiftuiArch
//
//  Created by Anna Zharkova on 28.02.2021.
//

import Foundation
import UIKit
import SwiftUI

class NewsItemConfigurator: IConfugator {
    func createScreen(_ data: Any?) -> UIViewController {
        let view = NewsItemView(item: data as! NewsItem)
        
        return UIHostingController(rootView: view)
    }
}
