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
        EmptyBackground {
            VStack {
                bar
                Spacer()
                
                Text("Guess which day is")
                    .foregroundColor(Color.white)
                    .font(Font.system(size: 32))
                Text(viewModel.dateToGuess)
                    .foregroundColor(Color.white)
                    .font(Font.system(size: 32))
                Spacer()
                
                HoneyCombGrid(
                    input: HoneyCombGrid.Input(
                        hiddenWeekday: $viewModel.weekday,
                        onTapWeekday: viewModel.weekdayChosen,
                        onTapReset: viewModel.resetDate
                    )
                )
                .aspectRatio(contentMode: .fit)
                
                Spacer()
            }
        }
        .sheet(isPresented: $viewModel.isStatsPresented) {
            StatisticsView(
                isPresented: $viewModel.isStatsPresented,
                viewModel: StatisticsView.ViewModel(dbClient: DBClient.live)
            )
        }
        .sheet(isPresented: $viewModel.isInfoPresented) {
            InfoView(isPresented: $viewModel.isInfoPresented)
        }
    }
    
    private var bar: some View {
        HStack {
            Image(systemName: "list.dash")
                .font(Font.system(size: 24))
                .foregroundColor(Color.white)
                .onTapGesture {
                    viewModel.isStatsPresented = true
                }
            
            Spacer()
            
            Image(systemName: "info.circle")
                .font(Font.system(size: 24))
                .foregroundColor(Color.white)
                .onTapGesture {
                    viewModel.isInfoPresented = true
                }
        }
        .padding(.top, 16)
        .padding(.horizontal, 32)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainView.ViewModel(dbClient: DBClient.live))
    }
}
