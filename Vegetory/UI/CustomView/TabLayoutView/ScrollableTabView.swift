//
//  ScrollableTabView.swift
//  Vegetory
//
//  Created by 이주연 on 2021/10/03.
//

import SwiftUI

struct ScrollableTabView : View {

    @Binding var activeIdx: Int
    @State private var w: [CGFloat]
    private let dataSet: [String]
    private let colour : Color
    init(
        activeIdx: Binding<Int>,
        dataSet: [String],
        getColour : Color ) {
        self._activeIdx = activeIdx
        self.dataSet = dataSet
        _w = State.init(initialValue: [CGFloat](repeating: 0, count: dataSet.count))
        
        self.colour = getColour
        
    }

    var body: some View {
        VStack(alignment: .underlineLeading) {
            HStack {
                ForEach(0..<dataSet.count) { i in
                    Text(dataSet[i])
                        .customFont(fontName: FontType.ImcreSoojin.rawValue, fontSize: 20)
                        .foregroundColor(colour)
                        .modifier(ScrollableTabViewModifier(activeIdx: $activeIdx, idx: i))
                        .background(TextGeometry())
                        .onPreferenceChange(WidthPreferenceKey.self, perform: { self.w[i] = $0 })
                        .id(i)
                    Spacer().frame(width: 20)
                }
            }
            .padding(.horizontal, 5)
            Rectangle()
                .alignmentGuide(.underlineLeading) { d in d[.leading]  }
                .frame(width: w[activeIdx],  height: 4)
                .animation(.linear)
                .foregroundColor(colour)
        }
    }
}
