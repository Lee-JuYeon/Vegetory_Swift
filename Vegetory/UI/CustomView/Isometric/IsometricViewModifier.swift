//
//  IsometricViewModifier.swift
//  Vegetory
//
//  Created by 이주연 on 2021/09/21.
//

import SwiftUI

struct IsometricViewModifier : ViewModifier {
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: 45), anchor: .center)
            .scaleEffect(x: 1.0, y: 0.5, anchor: .center)
    }
}
