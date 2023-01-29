//
//  SegmentedControl.swift
//  DoomsdayTraining
//
//  Created by Александр Шакмаков on 22.12.2022.
//

import SwiftUI

struct SegmentedControl: View {
    var titles: [String]

    @Binding var selectedIndex: Int

    var body: some View {
        HStack(spacing: 0) {
            ForEach(titles.indices, id: \.self) { index in
                Button(
                    action: {
                        selectedIndex = index
                    },
                    label: {
                        let color = index == selectedIndex
                            ? Colors.darkGray
                            : Color.white

                        Text(titles[index])
                            .foregroundColor(color)
                            .lineLimit(1)
                            .padding(.horizontal, 2)
                            .padding(.vertical, 15)
                            .frame(maxWidth: .infinity)
                            .cornerRadius(16)
                    }
                )
            }
        }
        .background(
            GeometryReader { geo in
                let xOffset = CGFloat(selectedIndex)
                    * (geo.size.width / CGFloat(titles.count))

                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .fill(Color.white)
                    .frame(
                        width: geo.size.width / CGFloat(titles.count),
                        height: geo.size.height,
                        alignment: .center
                    )
                    .offset(
                        x: xOffset,
                        y: 0
                    )
            }
        )
        .padding(.all, 4)
        .background(
            Rectangle()
                .fill(Colors.darkGray)
                .overlay(
                    RoundedRectangle(cornerRadius: 18)
                        .stroke(Color.white, style: StrokeStyle(lineWidth: 2))
                )
        )
        .cornerRadius(18)
        .animation(.easeIn(duration: 0.2), value: selectedIndex)
    }
}

struct SegmentedControl_Previews: PreviewProvider {
    @State static var selectedIndex = 0

    static var previews: some View {
        SegmentedControl(
            titles: ["Вход", "Регистрация"],
            selectedIndex: $selectedIndex
        )
        .background(Colors.gray)
        .previewLayout(PreviewLayout.sizeThatFits)
    }
}
