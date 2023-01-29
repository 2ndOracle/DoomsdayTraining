//
//  BlendingText.swift
//  DoomsdayTraining
//
//  Created by Александр Шакмаков on 22.12.2022.
//

import SwiftUI

struct BlendingText: View {
    let text: LocalizedStringKey
    let font: Font
    
    var body: some View {
        label
            .foregroundColor(.white)
            .blendMode(.difference)
            .overlay(label.blendMode(.hue))
            .overlay(label.foregroundColor(.white).blendMode(.overlay))
            .overlay(label.foregroundColor(.black).blendMode(.overlay))
    }
    
    private var label: some View {
        Text(text)
            .font(font)
    }
}

struct BlendingText_Previews: PreviewProvider {
    static var previews: some View {
        BlendingText(
            text: "4/4 6/6 8/8 10/10 12/12 7/11 11/7 5/9 9/5 14/3",
            font: Font.system(size: 32).bold()
        )
    }
}
