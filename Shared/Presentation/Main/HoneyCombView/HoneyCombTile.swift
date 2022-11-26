//
//  HoneyCombTILE.swift
//  Doomsday Training
//
//  Created by Александр Шакмаков on 28.10.2022.
//

import SwiftUI

struct HoneyCombTile: View {
    let input: Input
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                input.color
                Text(input.text)
                    .foregroundColor(Colors.mainBg)
                    .font(Font.system(size: 48).bold())
            }
            .frame(width: input.tileSize.width, height: input.tileSize.height)
            .clipShape(
                PolygonShape(sides: 6)
                    .rotation(Angle.degrees(90))
            )
            
        }
        .frame(width: input.hexagonWidth, height: input.tileSize.height * 0.75)
    }
}

extension HoneyCombTile {
    struct Input {
        let color: Color
        let tileSize: CGSize
        let hexagonWidth: CGFloat
        let text: String
    }
}

struct HoneyCombTile_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Colors.mainBg
            HoneyCombTile(
                input: HoneyCombTile.Input(
                    color: Color.white,
                    tileSize: CGSize(width: 200, height: 200),
                    hexagonWidth: CGFloat(200),
                    text: "MO"
                )
            )
        }
    }
}
