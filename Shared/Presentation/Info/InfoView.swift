//
//  InfoView.swift
//  DoomsdayTraining
//
//  Created by Александр Шакмаков on 26.11.2022.
//

import SwiftUI

struct InfoView: View {
    @Binding var isPresented: Bool

    var body: some View {
        EmptyBackground {
            BubblyBackground()
            
            VStack {
                bar

                linkText
                    .foregroundColor(.white)
                    .blendMode(.difference)
                    .overlay(linkText.blendMode(.hue))
                    .overlay(linkText.foregroundColor(.white).blendMode(.overlay))
                    .overlay(linkText.foregroundColor(.black).blendMode(.overlay))
                                
                hintText
                    .foregroundColor(.white)
                    .blendMode(.difference)
                    .overlay(hintText.blendMode(.hue))
                    .overlay(hintText.foregroundColor(.white).blendMode(.overlay))
                    .overlay(hintText.foregroundColor(.black).blendMode(.overlay))
                
                Spacer()
            }
        }
    }
    
    private var hintText: some View {
        Text("4/4 6/6 8/8 10/10 12/12 7/11 11/7 5/9 9/5 14/3")
            .font(Font.system(size: 32).bold())
            .padding(.horizontal, 32)
    }
    
    private var linkText: some View {
        let linkText = "link_text".localized
        let linkVideo = "link_video".localized
        return Text("\(linkText) [\(linkVideo)](https://youtu.be/z2x3SSBVGJU)")
            .font(Font.system(size: 86).bold())
            .padding()
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

    static var previews: some View {
        InfoView(isPresented: $isPresented)
    }
}
