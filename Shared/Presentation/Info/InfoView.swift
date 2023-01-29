//
//  InfoView.swift
//  DoomsdayTraining
//
//  Created by Александр Шакмаков on 26.11.2022.
//

import SwiftUI

struct InfoView: View {
    @Binding var isPresented: Bool
    @StateObject var viewModel: ViewModel

    var body: some View {
        EmptyBackground {
            BubblyBackground()
            
            VStack {
                bar
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading) {
                        BlendingText(
                            text: "explanation",
                            font: Font.system(size: 48).bold()
                        )
                        .padding(.top)
                        
                        linkText
                            .padding(.horizontal, 32)
                        
                        BlendingText(
                            text: "hints",
                            font: Font.system(size: 48).bold()
                        )
                        .padding(.top, 1)

                        BlendingText(
                            text: "4/4 | 6/6 | 8/8 | 10/10 | 12/12 | 7/11 | 11/7 | 5/9 | 9/5 | 14/3",
                            font: Font.system(size: 32).bold()
                        )
                        .padding(.horizontal, 24)
                        
                        BlendingText(
                            text: "settings",
                            font: Font.system(size: 48).bold()
                        )
                        .padding(.top, 1)
                        
                        SegmentedControl(
                            titles: [
                                "year".localized,
                                "century".localized,
                                "a_lot".localized
                            ],
                            selectedIndex: $viewModel.selectedIndex
                        )
                        .padding(.bottom, 24)
                        
                        Toggle(isOn: $viewModel.soundEnabled) {
                            BlendingText(
                                text: "sound_enabled",
                                font: Font.system(size: 32).bold()
                            )
                        }
                        .tint(Color.mint)
                        .padding(.bottom, 24)
                    }
                    .padding(.horizontal, 32)
                }
            }
        }
    }
    
    private var linkText: some View {
        let linkVideo = "link_video".localized
        return BlendingText(
            text: "[\(linkVideo)](https://youtu.be/z2x3SSBVGJU)",
            font: Font.system(size: 48).bold()
        )
    }
        
    private var bar: some View {
        ZStack {
            Text("info".localized)
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
}

struct InfoView_Previews: PreviewProvider {
    @State static var isPresented: Bool = false
    @State static var viewModel = InfoView.ViewModel()

    static var previews: some View {
        InfoView(isPresented: $isPresented, viewModel: viewModel)
    }
}
