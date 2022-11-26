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
            generateRandomDate()
        }

        // MARK: - Properties
        private var date: Date!
        
        // MARK: - View state
        @Published var dateToGuess = ""
        @Published var text = ""
        @Published var weekday = Weekday.monday
        
        //todo
        @Published var movies: [DBGuessAttempt] = []
    }
}

// MARK: - Input
extension MainView.ViewModel {
    func resetDate() {
        generateRandomDate()
    }
    
    func weekdayChosen(_ weekday: Weekday) {
        let attempt = GuessAttempt(
            dateToGuess: Date(),
            guessedWeekday: Weekday.monday,
            attemptDate: Date()
        )
        
        
//        let dbModel = DBGuessAttempt(provider.persistentContainer.viewContext, with: attempt)
//        
//        try! provider.persistentContainer.viewContext.save()
        
        print(weekday)//todo
    }
}
import UIKit
// MARK: - Private
extension MainView.ViewModel {
    private func generateRandomDate() {
        date = Date.random()
        dateToGuess = Date.formatter.string(from: date)
        weekday = Weekday(date: date)
        
        //todo
        let fetchRequest: NSFetchRequest<DBGuessAttempt>
        fetchRequest = DBGuessAttempt.fetchRequest()

//        let context = provider.persistentContainer.viewContext

        // Perform the fetch request to get the objects
        // matching the predicate
//        let objects = try! context.fetch(fetchRequest)
        
//        movies = objects
    }
}
