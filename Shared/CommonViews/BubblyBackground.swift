//
//  BubblyBackground.swift
//  DoomsdayTraining
//
//  Created by Александр Шакмаков on 19.12.2022.
//

import SwiftUI

struct BubblyBackground: View {
    @State private var scale: CGFloat = 1
    
    var body: some View {
        ZStack {
            ForEach (4...10, id:\.self) { _ in
                Circle()
                    .foregroundColor(Color.white)
                    .animation(
                        Animation.spring(dampingFraction: 0.5)
                            .repeatForever()
                            .speed(.random(in: 0.05...0.1))
                            .delay(.random (in: 0...1)),
                        value: scale
                    )
                    .scaleEffect(self.scale * .random(in: 0.1...3))
                    .frame(
                        width: CGFloat.random(in: 30...100),
                        height: CGFloat.random(in: 30...100),
                        alignment: .center
                    )
                    .position(CGPoint(
                        x: .random(in: 60...400),
                        y: .random(in: 100...834)
                    ))
                    .blur(radius: .random(in: 4...10))
            }
        }
        .onAppear {
            self.scale = 1.2
        }
        .drawingGroup(opaque: false, colorMode: .linear)
        .background(
            Rectangle()
                .foregroundColor(Colors.gray)
        )
        .ignoresSafeArea()
    }
}

struct BubblyBackground_Previews: PreviewProvider {
    static var previews: some View {
        BubblyBackground()
    }
}
