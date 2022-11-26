//
//  DBGuessAttempt.swift
//  Doomsday Training
//
//  Created by Александр Шакмаков on 05.11.2022.
//

import CoreData

extension GuessAttempt {
    init?(from model: DBGuessAttempt) {
        guard
            let dateToGuess = model.dateToGuess,
            let guessedWeekday = Weekday(rawValue: Int(model.guessedWeekday)),
            let attemptDate = model.attemptDate
        else {
            return nil
        }
        self.init(
            dateToGuess: dateToGuess,
            guessedWeekday: guessedWeekday,
            attemptDate: attemptDate
        )
    }
}

// MARK: - DBPuttable
extension GuessAttempt: DBPuttable {
    func put(in context: NSManagedObjectContext) {
        let dbModel = DBGuessAttempt.init(context: context)
        dbModel.dateToGuess = dateToGuess
        dbModel.guessedWeekday = Int16(guessedWeekday.rawValue)
        dbModel.attemptDate = attemptDate
    }
}

// MARK: - DBFetchable
extension DBGuessAttempt: DBFetchableModel {}

extension GuessAttempt: DBFetchable {
    typealias DBModel = DBGuessAttempt
}
