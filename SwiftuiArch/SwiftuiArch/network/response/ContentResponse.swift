//
//  ContentResponse.swift
//  news_swiftUI-combine
//
//  Created by Anna Zharkova on 16.02.2021.
//

import Foundation

class ContentResponse<T:Codable> {
    var content: T?
    var error:ErrorResponse? = nil
    var code: Int = 0
    
    init() {}
    
    convenience init(response: HTTPURLResponse?, data: Data) {
        self.init()
        code = response?.statusCode ?? 0
        let string = String(data: data, encoding: .utf8)
        print(string)
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd'T'hh:mm:ss'Z'"
        jsonDecoder.dateDecodingStrategy = .formatted(df)
        if code >= 200 && code < 400 {
            do {
                let result = try jsonDecoder.decode(T.self, from: data)
                content = result
            } catch {
                print("\(error.localizedDescription)")
            }
        } else {
            do {
                self.error = try jsonDecoder.decode(ErrorResponse.self, from: data)
                self.error?.code = code
            }
            catch {
               print("\(error.localizedDescription)")
           }
        }
    }
}
