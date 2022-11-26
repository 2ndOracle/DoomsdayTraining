//
//  StatisticsView.swift
//  DoomsdayTraining
//
//  Created by Александр Шакмаков on 23.11.2022.
//

import SwiftUI

struct StatisticsView: View {
    
    let rows = Array(
        repeating: AttemptRow(
            date: "12 12 1999",
            dateToGuess: Date(),
            guessedWeekday: Weekday.monday,
            correctWeekday: Weekday.tuesday
        ),
        count: 8
    ) + Array(
        repeating: AttemptRow(
            date: "12 12 1999",
            dateToGuess: Date(),
            guessedWeekday: Weekday.monday,
            correctWeekday: Weekday.monday
        ),
        count: 12
    )
    
    var body: some View {
        //todo вынести в bg вьюху
        EmptyBackground {
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 0) {
                    ForEach((1...rows.count), id: \.self) { index in
                        let rowData = rows[index - 1]
                        let isCorrect = rowData.correctWeekday
                            == rowData.guessedWeekday
                        HStack {
                            Text(String(index))
                                .foregroundColor(.white)
                                .padding(.leading, 8)
                            Spacer()
                            Text(rowData.date)
                                .foregroundColor(.white)
                            Text(" - ")
                                .foregroundColor(.white)
                            Text(rowData.correctWeekday.name)
                                .foregroundColor(.white)
                            Spacer()
                            Text(rowData.guessedWeekday.name)
                                .foregroundColor(.white)
                            Spacer()
                            Rectangle()
                                .foregroundColor(isCorrect ? .green : .red)
                                .aspectRatio(1.0, contentMode: .fit)
                                .frame(maxHeight: 24)
                                .padding(.trailing, 8)
                        }
                        .padding(.vertical, 8)
                        .border(.white)
                    }
                }
            }
        }
    }
    
    //todo
    struct AttemptRow {
        let date: String
        let dateToGuess: Date
        let guessedWeekday: Weekday
        let correctWeekday: Weekday
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
    }
}
