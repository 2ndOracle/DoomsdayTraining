//
//  String+Localized.swift
//  DoomsdayTraining
//
//  Created by Александр Шакмаков on 26.11.2022.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
