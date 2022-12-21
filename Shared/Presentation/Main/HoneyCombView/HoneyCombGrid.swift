//
//  HoneyCombGrid.swift
//  Doomsday Training
//
//  Created by Александр Шакмаков on 27.10.2022.
//

import AVFoundation
import SwiftUI

struct HoneyCombGrid: View {
    let input: Input
    
    private let columnsCount: Int = 3
    private let spacing: CGFloat = 10
    private let emptyTileIndex: Int = 2
    
    @State private var isInitialState = true
    @State private var tileData = Self.createInitialTileData()
    
    var body: some View {
        GeometryReader { geometry in
            
            let colsCount = CGFloat(columnsCount)
            let tileSide: CGFloat = (geometry.size.width - colsCount + 1) / colsCount
            let tileSize = CGSize(width: tileSide, height: tileSide)
            let hexagonWidth: CGFloat = (tileSize.width / 2) * cos(.pi / 6) * 2
            let gridItems = getGridItems(
                hexagonWidth: hexagonWidth,
                count: columnsCount
            )
            
            LazyVGrid(columns: gridItems, spacing: spacing) {
                ForEach(tileData.indices, id: \.self) { index in
                    let data = tileData[index]
                    
                    HoneyCombTile(
                        input: HoneyCombTile.Input(
                            color: data.color,
                            tileSize: tileSize,
                            hexagonWidth: hexagonWidth,
                            text: data.text
                        )
                    )
                    .offset(x: isEvenRow(index) ? hexagonWidth / 2 + (spacing/2) : 0)
                    .contentShape(
                        Rectangle()
                            .offset(x: isEvenRow(index) ? hexagonWidth / 2 + (spacing/2) : 0)
                    )
                    .onTapGesture {
                        guard index != emptyTileIndex else { return }
                        if isInitialState {
                            // TODO: - сделать настройку
                            AudioServicesPlaySystemSound(SystemSoundID(1104))
                            onTap(index: index)
                        } else {
                            isInitialState = true
                            input.onTapReset()
                            withAnimation {
                                tileData = Self.createInitialTileData()
                            }
                        }
                    }
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

// MARK: - Input
extension HoneyCombGrid {
    
    struct Input {
        let hiddenWeekday: Binding<Weekday>
        let onTapWeekday: (Weekday) -> ()
        let onTapReset: () -> ()
    }
    
    private func onTap(index: Int) {
        // +1 day from empty Tile
        let dayIndex = index <= emptyTileIndex ? index : index - 1
        let weekday = Weekday.allCases[dayIndex]
        input.onTapWeekday(weekday)
        
        withAnimation(Animation.easeOut) {
            tileData.enumerated().forEach { index, element in
                tileData[index].color = element.text.isEmpty ? .clear : .gray
            }
            
            if weekday == input.hiddenWeekday.wrappedValue {
                tileData[index].color = Colors.mint
            } else {
                tileData[index].color = Colors.red
            }
        }
        
        isInitialState = false
    }
}

// MARK: - UI
extension HoneyCombGrid {
    
    private func getGridItems(hexagonWidth: CGFloat, count: Int) -> [GridItem] {
        let gridItems = Array(
            repeating: GridItem(.fixed(hexagonWidth), spacing: spacing),
            count: count
        )
        
        return gridItems
    }
    
    private func isEvenRow(_ index: Int) -> Bool {
        (index / columnsCount) % 2 == 0
    }
}

// MARK: - TileData
extension HoneyCombGrid {
    
    struct TileData {
        let text: String
        var color: Color
    }
    
    private static func createInitialTileData() -> [HoneyCombGrid.TileData] {
        var tileData = Weekday.allCases.map { weekday in
            HoneyCombGrid.TileData(
                text: weekday.shortName,
                color: Color.white
            )
        }
        tileData.insert(
            HoneyCombGrid.TileData(
                text: "",
                color: Color.clear
            ),
            at: 2
        )
        
        return tileData
    }
}


struct HoneyCombGrid_Previews: PreviewProvider {
    @State static var weekday = Weekday.sunday
    
    static var previews: some View {
        EmptyBackground {
            HoneyCombGrid(
                input: HoneyCombGrid.Input(
                    hiddenWeekday: $weekday,
                    onTapWeekday: { w in },
                    onTapReset: { }
                )
            )
        }
    }
}
