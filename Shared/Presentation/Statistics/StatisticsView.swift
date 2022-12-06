//
//  StatisticsView.swift
//  DoomsdayTraining
//
//  Created by Александр Шакмаков on 23.11.2022.
//

import SwiftUI

struct StatisticsView: View {
    @Binding var isPresented: Bool
    @StateObject var viewModel: ViewModel
  
    var body: some View {
        EmptyBackground {
            VStack {
                bar
                
                ScrollView(showsIndicators: false) {
                    if !viewModel.attemptRows.isEmpty {
                        table
                    } else {
                        Spacer()//todo wrong placeholder
                    }
                }
            }
        }
    }
    
    private var bar: some View {
        ZStack {
            Text("Attempts")
                .foregroundColor(.white)
                .font(Font.system(size: 24).bold())
                .padding(.top, 8)
            
            HStack {
                Spacer()
                
                Text("Cancel")
                    .foregroundColor(.white)
                    .font(Font.system(size: 18).bold())
                    .padding(.trailing, 8)
                    .padding(.top, 8)
                    .onTapGesture {
                        isPresented = false
                    }
            }
        }
    }
    
    private var table: some View {
        LazyVStack(spacing: 0) {
            ForEach((1...viewModel.attemptRows.count), id: \.self) { index in
                let rowData = viewModel.attemptRows[index - 1]
                let isCorrect = rowData.correctWeekday
                    == rowData.guessedWeekday
                HStack {
                    Text(String(index))
                        .foregroundColor(.white)
                        .padding(.leading, 8)
                    Text(rowData.date)
                        .foregroundColor(.white)
                    Text(rowData.correctWeekday.shortName)
                        .foregroundColor(.white)
                    Spacer()
                    Text(rowData.guessedWeekday.shortName)
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

// MARK: - Model
extension StatisticsView {
    struct AttemptRow {
        let date: String
        let dateToGuess: Date
        let guessedWeekday: Weekday
        let correctWeekday: Weekday
    }
}

struct StatisticsView_Previews: PreviewProvider {
    @State static var isPresented: Bool = false
    
    static var previews: some View {
        StatisticsView(
            isPresented: $isPresented,
            viewModel: StatisticsView.ViewModel(dbClient: DBClient.live)
        )
    }
}
