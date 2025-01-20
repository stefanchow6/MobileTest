//
//  BookingCache.swift
//  MobileTest
//
//  Created by zhouzhenhua on 2025/1/18.
//

import Foundation

class BookingCache {
    
    var isExpired: Bool {
        guard let updateDate = updateDate else {
            return true
        }
        return NSDate().timeIntervalSince(updateDate) > duration
    }
    
    private let duration: TimeInterval
    private var data: [String: Any]?
    private var updateDate: Date?
    
    init(duration: TimeInterval) {
        self.duration = duration
    }
    
    func update(_ data: [String: Any]) {
        self.data = data
        self.updateDate = Date()
    }
    
    func get() -> [String: Any]? {
        self.data
    }
}
