//
//  IPresenter.swift
//  SwiftuiArch
//
//  Created by Anna Zharkova on 28.02.2021.
//

import Foundation

protocol IPresenter {
    
    func showError(error: String)
    
    func showLoading()
    
    func hideLoading()
}
