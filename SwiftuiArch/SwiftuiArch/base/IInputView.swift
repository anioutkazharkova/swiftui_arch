//
//  IInputView.swift
//  SwiftuiArch
//
//  Created by Anna Zharkova on 28.02.2021.
//

import Foundation

protocol IInputView {
    func updateModel(data: Any?)
}

protocol  IModel:class {
    func update(data: Any?)
    
}
