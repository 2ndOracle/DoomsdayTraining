//
//  StaisticsVM.swift
//  DoomsdayTraining
//
//  Created by Александр Шакмаков on 05.12.2022.
//

import Foundation

extension StatisticsView {
    final class ViewModel: ObservableObject {
        
        // MARK: - Input
        private let dbClient: DBClient

        init(dbClient: DBClient) {
            self.dbClient = dbClient
            readFromDB()
        }

        // MARK: - Properties
        
        // MARK: - View state
        @Published var attemptRows = [AttemptRow]()
    }
}

// MARK: - Private
private extension StatisticsView.ViewModel {
    
    func readFromDB() {
        let attempts = dbClient.fetch(GuessAttempt.self)
        let rows = mapToRows(attempts)
        attemptRows = rows
    }
    
    func mapToRows(_ attempts: [GuessAttempt]) -> [StatisticsView.AttemptRow] {
        attempts.map { attempt in
            StatisticsView.AttemptRow(
                date: Date.intFormatter.string(from: attempt.dateToGuess),
                dateToGuess: attempt.dateToGuess,
                guessedWeekday: attempt.guessedWeekday,
                correctWeekday: Weekday(date: attempt.dateToGuess)
            )
        }
    }
}
