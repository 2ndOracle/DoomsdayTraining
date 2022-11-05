//
//  MainVM.swift
//  Doomsday Training
//
//  Created by Александр Шакмаков on 26.10.2022.
//

import SwiftUI

extension MainView {
    final class ViewModel: ObservableObject {

        init() { generateRandomDate() }

        // MARK: - Properties
        private var date: Date!
        
        // MARK: - View state
        @Published var dateToGuess = ""
        @Published var text = ""
        @Published var weekday = Weekday.monday
    }
}

// MARK: - Input
extension MainView.ViewModel {
    func resetDate() {
        generateRandomDate()
    }
    
    func weekdayChosen(_ weekday: Weekday) {
        print(weekday)//todo
    }
}

// MARK: - Private
extension MainView.ViewModel {
    private func generateRandomDate() {
        date = Date.random()
        dateToGuess = Date.formatter.string(from: date)
        weekday = Weekday(date: date)
    }
}
