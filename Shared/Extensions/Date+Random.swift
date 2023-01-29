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
        case 1: return yearDate
        case 2: return centuryDate
        case 3: return bigDate
        default: return bigDate
        }
    }
}

// MARK: - Ranges
private extension Date {
    static var bigDate: ClosedRange<TimeInterval> {
        intFormatter.date(
            from: "01 01 1800"
        )!.timeIntervalSinceNow...intFormatter.date(
            from: "01 01 2300"
        )!.timeIntervalSinceNow
    }
    
    static var centuryDate: ClosedRange<TimeInterval> {
        intFormatter.date(
            from: "01 01 2000"
        )!.timeIntervalSinceNow...intFormatter.date(
            from: "01 01 2100"
        )!.timeIntervalSinceNow
    }
    
    static var yearDate: ClosedRange<TimeInterval> {
        let currentYear = currentYear()
        
        return intFormatter.date(
            from: "01 01 \(currentYear)"
        )!.timeIntervalSinceNow...intFormatter.date(
            from: "31 12 \(currentYear)"
        )!.timeIntervalSinceNow
    }

    private static func currentYear() -> String {
        return String(Calendar.current.component(.year, from: Date()))
    }
}
