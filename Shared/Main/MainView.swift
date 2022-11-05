//
//  MainView.swift
//  Doomsday Training
//
//  Created by Александр Шакмаков on 26.10.2022.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel: ViewModel
    //todo
    let provider = ContainerProviderClient.live

    var body: some View {
        ZStack {
            Colors.mainBg
            VStack {
                Spacer()
                Text("Guess which day is")
                    .foregroundColor(Color.white)
                    .font(Font.system(size: 32))
                
                Text(viewModel.dateToGuess)
                    .foregroundColor(Color.white)
                    .font(Font.system(size: 32))
                //todo
                HoneyCombGrid(input: HoneyCombGrid.Input(
                    hiddenWeekday: $viewModel.weekday,
                    onTapWeekday: viewModel.weekdayChosen,
                    onTapReset: viewModel.resetDate
                ))
                .aspectRatio(contentMode: .fit)
                Spacer()
                VStack {
//                    ForEach
                    Spacer()
                }
            }
        }
        .ignoresSafeArea()
        .environment(\.locale, .init(identifier: "ru"))
        .onAppear {
//            let dbModel = DBGuessAttempt(context: provider.persistentContainer.viewContext)
//            dbModel.dateToGuess = Date()
//            dbModel.attemptDate = Date()
//            dbModel.guessedWeekday = Int16(Weekday.monday.rawValue)
            
            
//            provider.persistentContainer.
        }
        //todo почему здесь и везде не работает
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: .init())
            .environment(\.locale, .init(identifier: "ru"))
    }
}
