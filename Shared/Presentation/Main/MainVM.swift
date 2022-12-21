//
//  MainVM.swift
//  Doomsday Training
//
//  Created by Александр Шакмаков on 26.10.2022.
//

import CoreData
import SwiftUI

extension MainView {
    final class ViewModel: ObservableObject {
        
        // MARK: - Input
        private let dbClient: DBClient

        init(dbClient: DBClient) {
            self.dbClient = dbClient
            refreshDateText()
        }

        // MARK: - Properties
        private var date: Date = Date.random() {
            didSet {
                refreshDateText()
            }
        }
        
        // MARK: - View state
        @Published var dateToGuess = ""
        @Published var text = ""
        @Published var weekday = Weekday.monday
        
        @Published var isStatsPresented = false
        @Published var isInfoPresented = false
    }
}

// MARK: - Input
extension MainView.ViewModel {
    func resetDate() {
        date = Date.random()
    }
    
    func weekdayChosen(_ weekday: Weekday) {
        let attempt = GuessAttempt(
            dateToGuess: date,
            guessedWeekday: weekday,
            attemptDate: Date()
        )
        
        dbClient.put(attempt)
    }
}

// MARK: - Private
private extension MainView.ViewModel {
    func refreshDateText() {
        dateToGuess = Date.mainFormatter.string(from: date)
        weekday = Weekday(date: date)
    }
}
