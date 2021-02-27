//
//  ErrorResponse.swift
//  news_swiftUI-combine
//
//  Created by Anna Zharkova on 16.02.2021.
//

import Foundation
enum ErrorType {
    case network, service, other
}

class ErrorResponse : Codable, Error {
    var message: String = ""
    var code: Int = 0
    var type: ErrorType = .other
    
    enum CodingKeys: String, CodingKey {
        case message, code
    }
    
    init(){}
    
    convenience init(type: ErrorType) {
        self.init()
        self.type = type 
    }
    
}
