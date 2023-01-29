//
//  InfoVM.swift
//  DoomsdayTraining
//
//  Created by Александр Шакмаков on 29.12.2022.
//

import Combine
import SwiftUI

extension InfoView {
    final class ViewModel: ObservableObject {
                
        // MARK: - Input
        init() {
            selectedIndex = Storage.Settings.difficulty
            soundEnabled = Storage.Settings.soundEnabled
            setupBindings()
        }

        // MARK: - Properties
        private var subscriptions = Set<AnyCancellable>()
        
        // MARK: - View state
        @Published var selectedIndex: Int
        @Published var soundEnabled: Bool
    }
}

// MARK: - Bindings
extension InfoView.ViewModel {
    func setupBindings() {
        $selectedIndex
            .sink {
                Storage.Settings.difficulty = $0
            }
            .store(in: &subscriptions)
        
        $soundEnabled
            .sink {
                Storage.Settings.soundEnabled = $0
            }
            .store(in: &subscriptions)
    }
}
