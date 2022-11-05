//
//  DoomsdayTrainingApp.swift
//  Shared
//
//  Created by Александр Шакмаков on 26.10.2022.
//

import SwiftUI

@main
struct DoomsdayTrainingApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.locale, .init(identifier: "ar"))
        }
    }
}
