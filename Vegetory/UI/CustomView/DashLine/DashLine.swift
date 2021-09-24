//
//  DashLine.swift
//  Vegetory
//
//  Created by 이주연 on 2021/09/24.
//

import SwiftUI

struct DashLine : View {
    var width : CGFloat
    var height : CGFloat
    var body: some View {
        DashLineShape()
            .stroke(style: StrokeStyle(lineWidth : height, dash: [width]))
            .frame(height : 1)
    }
}

struct DashLineShape : Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}
