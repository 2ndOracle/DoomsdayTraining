//
//  DBGuessAttempt.swift
//  Doomsday Training
//
//  Created by Александр Шакмаков on 05.11.2022.
//

extension DBGuessAttempt {
    convenience init(from entity: GuessAttempt) {
        self.init()
        self.dateToGuess = entity.dateToGuess
        self.guessedWeekday = Int16(entity.guessedWeekday.rawValue)
        self.attemptDate = entity.attemptDate
    }
}

private extension GuessAttempt {
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
