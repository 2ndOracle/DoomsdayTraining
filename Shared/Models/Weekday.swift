//
//  Weekday.swift
//  Doomsday Training
//
//  Created by Александр Шакмаков on 29.10.2022.
//

import Foundation

enum Weekday: Int, CaseIterable {
    case monday = 1
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}

// MARK: - Init
extension Weekday {
    init(date: Date) {
        let weekdayNumber = Calendar.current.component(.weekday, from: date)

        let initRange = 1...Weekday.allCases.count
        if initRange.contains(weekdayNumber) {
            self.init(rawValue: weekdayNumber)!
        } else {
            assertionFailure("Error init weekday")
            self = .monday
        }
    }
}

// MARK: - Short name
extension Weekday {
    var shortName: String {
        switch self {
        case .monday:
            return "monday_short".localized
        case .tuesday:
            return "tuesday_short".localized
        case .wednesday:
            return "wednesday_short".localized
        case .thursday:
            return "thursday_short".localized
        case .friday:
            return "friday_short".localized
        case .saturday:
            return "saturday_short".localized
        case .sunday:
            return "sunday_short".localized
        }
    }
}

//todo
extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
