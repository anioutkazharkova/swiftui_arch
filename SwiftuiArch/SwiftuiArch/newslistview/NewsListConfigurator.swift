//
//  NewsListConfigurator.swift
//  SwiftuiArch
//
//  Created by Anna Zharkova on 28.02.2021.
//

import Foundation
import UIKit
import SwiftUI

class NewsListConfigurator: IConfugator {
    func createScreen(_ data: Any?) -> UIViewController {
        var view = NewsListView()
        let presenter = NewsListPresenter()
        presenter.view = view
        view.presenter = presenter
        return UIHostingController<ContainerView<NewsListView>>(rootView: ContainerView(content: view))
    }
}
