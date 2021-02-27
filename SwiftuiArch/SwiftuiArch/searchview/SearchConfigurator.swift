//
//  SearchConfigurator.swift
//  SwiftuiArch
//
//  Created by Anna Zharkova on 28.02.2021.
//

import Foundation
import UIKit
import SwiftUI

class SearchConfigurator: IConfugator {
    func createScreen(_ data: Any?) -> UIViewController {
        var view = SearchView()
        let presenter = SearchPresenter()
        presenter.view = view
        view.presenter = presenter
        
        return UIHostingController<ContainerView<SearchView>>(rootView: ContainerView(content: view))
    }
}
