//
//  Date+Formatter.swift
//  Doomsday Training
//
//  Created by Александр Шакмаков on 26.10.2022.
//

import Foundation

// MARK: - Formatters
extension Date {
    static let intFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone.default
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return dateFormatter
    }()
    
    static let mainFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone.default
        dateFormatter.dateFormat = "d MMMM yyyy"
        return dateFormatter
    }()

    static private let formatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone.default
        dateFormatter.dateFormat = "d MMM yyyy"
        return dateFormatter
    }()
}
