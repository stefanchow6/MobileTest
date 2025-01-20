//
//  BookingManager.swift
//  MobileTest
//
//  Created by zhouzhenhua on 2025/1/18.
//

import Foundation

class BookingManager {
    static let shared: BookingManager = BookingManager()
    
    private let cache: BookingCache = BookingCache(duration: .fiveMins)
    private let service: BookingService = BookingService()
    
    private init() {}
    
    func queryBookingData() async throws -> [String: Any] {
        if let data = cache.get() {
            if cache.isExpired {
                autoRefreshBookingData()
            }
            return data
        } else {
            return try await queryBookingDataInternal()
        }
    }
    
    private func autoRefreshBookingData() {
        Task {
            do {
                _ = try await queryBookingDataInternal()
                print("auto refresh booking data success")
            } catch {
                print("auto refresh booking data: \(error)")
            }
        }
    }
    
    private func queryBookingDataInternal() async throws -> [String: Any] {
        var data = try await service.requestData()
        data["expiryTime"] = Int(Date().timeIntervalSince1970 + .fiveMins)
        data["duration"] = Int(.fiveMins)
        cache.update(data)
        return data
    }
}

fileprivate extension TimeInterval {
    static let fiveMins: TimeInterval = 5 * 60
}
