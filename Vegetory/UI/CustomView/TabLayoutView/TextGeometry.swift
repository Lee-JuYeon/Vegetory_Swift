//
//  TextGeometry.swift
//  Vegetory
//
//  Created by 이주연 on 2021/10/03.
//

import SwiftUI

struct TextGeometry: View {
    var body: some View {
        GeometryReader { geometry in
            return Rectangle()
                .fill(Color.clear)
                .preference(
                    key: WidthPreferenceKey.self,
                    value: geometry.size.width
                )
        }
    }
}
