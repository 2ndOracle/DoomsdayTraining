//
//  ContentView.swift
//  Shared
//
//  Created by Александр Шакмаков on 26.10.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MainView(viewModel: .init(dbClient: DBClient.live))
            .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
