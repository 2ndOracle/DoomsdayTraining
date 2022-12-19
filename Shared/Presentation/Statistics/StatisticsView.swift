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
                        tableHeader
                        table
                    } else {
                        Image(systemName: "sun.haze")
                            .padding(.top, 24)
                            .font(Font.system(size: 212))
                            .foregroundColor(Color.white)
                    }
                }
            }
        }
    }
    
    private var bar: some View {
        ZStack {
            Text("attempts".localized)
                .foregroundColor(.white)
                .font(Font.system(size: 24).bold())
                .padding(.top, 8)
            
            HStack {
                Spacer()
                
                Text("cancel".localized)
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
                        .monospacedDigit()
                        .frame(minWidth: 40)
                    divider
                    Text(rowData.date)
                        .foregroundColor(.white)
                        .monospacedDigit()
                        .frame(minWidth: 100)
                    
                    Group {
                        divider
                        Text(rowData.correctWeekday.name)
                            .foregroundColor(.white)
                            .frame(minWidth: 80)
                        divider
                        Text(rowData.guessedWeekday.name)
                            .foregroundColor(.white)
                            .frame(minWidth: 80)
                        Spacer()
                    }
                    
                    divider
                    Rectangle()
                        .foregroundColor(isCorrect ? Colors.mint : Colors.red)
                        .aspectRatio(1.0, contentMode: .fit)
                        .frame(maxHeight: 24)
                        .cornerRadius(12)
                        .padding(.trailing, 8)
                }
                .padding(.vertical, 8)
                .border(.white)
            }
        }
    }
    
    private var tableHeader: some View {
        HStack {
            Text("№")
                .foregroundColor(.white)
                .monospacedDigit()
                .frame(minWidth: 40)
            divider
            Text("guess_date".localized)
                .foregroundColor(.white)
                .monospacedDigit()
                .frame(minWidth: 100)
            
            Group {
                divider
                Text("correct".localized)
                    .foregroundColor(.white)
                    .frame(minWidth: 80)
                divider
                Text("your".localized)
                    .foregroundColor(.white)
                    .frame(minWidth: 80)
                Spacer()
            }
            
            divider
            Text("😏")
                .foregroundColor(.white)
                .padding(.trailing, 8)
        }
        .padding(.vertical, 8)
        .border(.white)
    }
    
    private var divider: some View {
        Divider()
            .frame(width: 2)
            .background(Color.white)
            .padding(.vertical, -8)
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
