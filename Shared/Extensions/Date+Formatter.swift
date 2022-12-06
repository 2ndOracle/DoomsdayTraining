//
//  Date+Formatter.swift
//  Doomsday Training
//
//  Created by Александр Шакмаков on 26.10.2022.
//

import Foundation

extension Date {
    static func random() -> Date {
        Date(
            timeIntervalSinceNow: .random(
                in: intFormatter.date(
                    from: "01 01 1800"
                )!.timeIntervalSinceNow...intFormatter.date(
                    from: "01 01 2300"
                )!.timeIntervalSinceNow
            )
        )
    }
    
    static let intFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone.default
        dateFormatter.dateFormat = "dd MM yyyy"
        return dateFormatter
    }()

    static let formatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone.default
        dateFormatter.dateFormat = "d MMM yyyy"
        return dateFormatter
    }()
}
