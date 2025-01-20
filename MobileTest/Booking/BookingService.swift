//
//  BookingService.swift
//  MobileTest
//
//  Created by zhouzhenhua on 2025/1/18.
//

import Foundation

class BookingService {
    
    func requestData() async throws -> [String: Any] {
        guard let jsonPath = Bundle.main.url(forResource: "booking", withExtension: "json") else {
            throw NSError(domain: "BookingService", code: -1, userInfo: [NSLocalizedDescriptionKey: "json path is wrong"])
        }
        
        let jsonData = try Data(contentsOf: jsonPath)
        let json = try JSONSerialization.jsonObject(with: jsonData)
        
        guard let json = json as? [String: Any] else {
            throw NSError(domain: "BookingService", code: -1, userInfo: [NSLocalizedDescriptionKey: "json type is wrong"])
        }
        
        return json
    }
}
