//
//  MainView.swift
//  Doomsday Training
//
//  Created by Александр Шакмаков on 26.10.2022.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel: ViewModel

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
                
                //todo взять сюда цвета из другой приложухи
                HoneyCombGrid(
                    input: HoneyCombGrid.Input(
                        hiddenWeekday: $viewModel.weekday,
                        onTapWeekday: viewModel.weekdayChosen,
                        onTapReset: viewModel.resetDate
                    )
                )
                .aspectRatio(contentMode: .fit)

                //todo
                Text(String(viewModel.movies.count))
                    .foregroundColor(.white)
            }
        }
        .ignoresSafeArea()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: .init(dbClient: DBClient.live))
    }
}
