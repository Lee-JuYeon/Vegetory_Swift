//
//  ExtensionsView.swift
//  Vegetory
//
//  Created by 이주연 on 2021/09/23.
//

import SwiftUI

extension View {
    func customCornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
           clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}

