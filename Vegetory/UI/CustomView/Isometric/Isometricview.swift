//
//  Isometricview.swift
//  Vegetory
//
//  Created by 이주연 on 2021/09/21.
//

import SwiftUI

struct Isometricview<Content: View>: View {
    
    var active: Bool
    var content: Content
    var extruded: Bool
    var depth: CGFloat
    
    init(active: Bool, extruded: Bool = false, depth: CGFloat = 20, @ViewBuilder content: ()-> Content) {
        self.active = active
        self.extruded = extruded
        self.depth = depth
        self.content = content()
    }
    
    @ViewBuilder var body: some View {
        if active {
            if extruded {
                content
                    .modifier(
                        ExtrudeModifier(
                            depth: depth,
                            texture: content
                        )
                    )
//                    .modifier(
//                        IsometricViewModifier(
//                            active: active
//                        )
//                    )
                    .animation(.easeInOut)
            } else {
                content
//                    .modifier(
//                        IsometricViewModifier(
//                            active: active
//                        ))
                    .animation(.easeInOut)
            }
        } else {
            content
                .animation(.easeInOut)
        }
        
    }
}
