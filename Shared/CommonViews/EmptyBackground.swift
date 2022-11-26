//
//  EmptyBackground.swift
//  DoomsdayTraining
//
//  Created by Александр Шакмаков on 26.11.2022.
//

import SwiftUI

struct EmptyBackground<Content: View>: View {
    
    var content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        ZStack {
            Colors.mainBg
                .ignoresSafeArea()
            content()
        }
    }
}

struct EmptyBackground_Previews: PreviewProvider {
    static var previews: some View {
        EmptyBackground {
            VStack {
                Text("""
    kmdkmkckdkcmkdmkcmkdckdmkcmkkmdkmkck
    kmdkmkckdkcmkdmkcmkdckdmkcmkkmdkmkck
    kmdkmkckdkcmkdmkcmkdckdmkcmkkmdkmkck
    kmdkmkckdkcmkdmkcmkdckdmkcmkkmdkmkck
    kmdkmkckdkcmkdmkcmkdckdmkcmkkmdkmkck
    kmdkmkckdkcmkdmkcmkdckdmkcmkkmdkmkck
    kmdkmkckdkcmkdmkcmkdckdmkcmkkmdkmkck
    kmdkmkckdkcmkdmkcmkdckdmkcmkkmdkmkck
    kmdkmkckdkcmkdmkcmkdckdmkcmkkmdkmkck
    kmdkmkckdkcmkdmkcmkdckdmkcmkkmdkmkck
    kmdkmkckdkcmkdmkcmkdckdmkcmkkmdkmkck
    kmdkmkckdkcmkdmkcmkdckdmkcmkkmdkmkck
    kmdkmkckdkcmkdmkcmkdckdmkcmkkmdkmkck
    kmdkmkckdkcmkdmkcmkdckdmkcmkkmdkmkck
    kmdkmkckdkcmkdmkcmkdckdmkcmkkmdkmkck
    """)
                    .foregroundColor(.white)
                Text("""
    IIIIIIIIIIIIIIIUUUUUUUUUUUUUUUWWWW
    IIIIIIIIIIIIIIIUUUUUUUUUUUUUUUWWWW
    IIIIIIIIIIIIIIIUUUUUUUUUUUUUUUWWWW
    IIIIIIIIIIIIIIIUUUUUUUUUUUUUUUWWWW
    IIIIIIIIIIIIIIIUUUUUUUUUUUUUUUWWWW
    IIIIIIIIIIIIIIIUUUUUUUUUUUUUUUWWWW
    IIIIIIIIIIIIIIIUUUUUUUUUUUUUUUWWWW
    IIIIIIIIIIIIIIIUUUUUUUUUUUUUUUWWWW
    IIIIIIIIIIIIIIIUUUUUUUUUUUUUUUWWWW
    IIIIIIIIIIIIIIIUUUUUUUUUUUUUUUWWWW
    IIIIIIIIIIIIIIIUUUUUUUUUUUUUUUWWWW
    IIIIIIIIIIIIIIIUUUUUUUUUUUUUUUWWWW
    IIIIIIIIIIIIIIIUUUUUUUUUUUUUUUWWWW
    IIIIIIIIIIIIIIIUUUUUUUUUUUUUUUWWWW
    IIIIIIIIIIIIIIIUUUUUUUUUUUUUUUWWWW
    """)
                    .foregroundColor(.white)
            }
        }
    }
}
