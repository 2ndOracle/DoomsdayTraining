//
//  Date+Random.swift
//  DoomsdayTraining
//
//  Created by Александр Шакмаков on 21.01.2023.
//

import Foundation

// MARK: - Random
extension Date {
    static func random() -> Date {
        Date(timeIntervalSinceNow: .random(in: userSelectedDateRange()))
    }
    
    private static func userSelectedDateRange() -> ClosedRange<TimeInterval> {
        switch Storage.Settings.difficulty {
        case 0: return yearDate
        case 1: return centuryDate
        case 2: return bigDate
        default: return bigDate
        }
    }
}

// MARK: - Date ranges
private extension Date {
    static let bigDate: ClosedRange<TimeInterval> = {
        intFormatter.date(
            from: "01 01 1800"
        )!.timeIntervalSinceNow...intFormatter.date(
            from: "01 01 2300"
        )!.timeIntervalSinceNow
    }()
    
    static let centuryDate: ClosedRange<TimeInterval> = {
        intFormatter.date(
            from: "01 01 2000"
        )!.timeIntervalSinceNow...intFormatter.date(
            from: "01 01 2100"
        )!.timeIntervalSinceNow
    }()
    
    static var yearDate: ClosedRange<TimeInterval> {
        return intFormatter.date(
            from: "01 01 \(currentYearString)"
        )!.timeIntervalSinceNow...intFormatter.date(
            from: "31 12 \(currentYearString)"
        )!.timeIntervalSinceNow
    }
    
    static let currentYearString: String = {
        return String(Calendar.current.component(.year, from: Date()))
    }()
}
