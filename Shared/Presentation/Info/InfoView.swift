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
            Triangle()
                .foregroundColor(.white)
            
            VStack {
                bar

                linkText
                    .foregroundColor(.white)
                    .blendMode(.difference)
                    .overlay(linkText.blendMode(.hue))
                    .overlay(linkText.foregroundColor(.white).blendMode(.overlay))
                    .overlay(linkText.foregroundColor(.black).blendMode(.overlay))
                
                Spacer()
            }
        }
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
//todo написать красивую и двигающуюся вью
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX * 1.5, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX * 1.5, y: rect.minY))
        
        
        //todo
        print(Solution().twoSum([2,7], 9))
        
        return path
    }
}

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var currentIndex = 0
        var secondIntIndex = 0
        var targetDiff = target
        for (index, num) in nums.enumerated() {
            targetDiff = target - num

            for (innerIndex, innerNum) in nums.enumerated() {
                if targetDiff == innerNum {
                    currentIndex = index
                    secondIntIndex = innerIndex
                }
            }
        }

        return [currentIndex, secondIntIndex]
    }
}
