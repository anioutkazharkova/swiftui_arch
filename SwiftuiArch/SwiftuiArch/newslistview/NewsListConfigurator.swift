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
        let interactor = NewsListInteractor()
        interactor.presenter = presenter
        view.output = interactor
        return UIHostingController<ContainerView<NewsListView>>(rootView: ContainerView(content: view))
    }
}
