//
//  Storage.swift
//  DoomsdayTraining
//
//  Created by Александр Шакмаков on 21.01.2023.
//


import SwiftUI
import Foundation

enum Storage {
    fileprivate static let suiteName: String = "com.sample.DarkTraining.main"

    // MARK: - Settings
    enum Settings {
        @DefaultsInt("difficulty") static var difficulty
        @DefaultsBool("soundEnabled") static var soundEnabled
    }
}

extension Storage {
    static func deleteAll() {
        UserDefaults.shared.removeSuite(named: Self.suiteName)
    }
}

@propertyWrapper private struct DefaultsInt {
    let key: String

    var wrappedValue: Int {
        get { UserDefaults.shared.integer(forKey: key) }
        set { UserDefaults.shared.set(newValue, forKey: key) }
    }

    init(_ key: String) {
        self.key = key
    }
}

@propertyWrapper private struct DefaultsBool {
    let key: String

    var wrappedValue: Bool {
        get { UserDefaults.shared.bool(forKey: key) }
        set { UserDefaults.shared.set(newValue, forKey: key) }
    }

    init(_ key: String) {
        self.key = key
    }
}

private extension UserDefaults {
    static var shared: UserDefaults {
        let combined = UserDefaults.standard
        combined.addSuite(named: Storage.suiteName)
        return combined
    }
}
