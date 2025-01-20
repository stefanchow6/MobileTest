//
//  DictionaryExtension.swift
//  MobileTest
//
//  Created by zhouzhenhua on 2025/1/18.
//

import Foundation

extension Dictionary {
    
    var toJsonString: String {
        guard JSONSerialization.isValidJSONObject(self), let jsonData = try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted), let jsonString = String(data: jsonData, encoding: .utf8) else {
            return "{}"
        }
        return jsonString
    }
}
