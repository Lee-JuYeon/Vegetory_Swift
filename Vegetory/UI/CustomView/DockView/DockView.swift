//
//  DockView.swift
//  Vegetory
//
//  Created by 이주연 on 2021/09/25.
//

import SwiftUI

struct DockView<GETVIEW : View>: View {
    private var getWidth : CGFloat
    private var getHeight : CGFloat
    private var getPlateColour : Color
    private var getView : GETVIEW
    
    init(
        setWidth : CGFloat,
        setHeight : CGFloat,
        setPlateColour : Color,
        @ViewBuilder setView : @escaping () -> GETVIEW
    ) {
        self.getWidth = setWidth
        self.getHeight = setHeight / 20
        self.getView = setView()
        self.getPlateColour = setPlateColour
    }
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(getPlateColour)
                .border(Color.black, width : 1)
                .frame(
                    width: getWidth - 10,
                    height:  getHeight * 2
                )
                .rotation3DEffect(
                    .degrees(-60), // 몇도를 회전된 상태를 보여줄거냐
                    axis: (x: 1, y:0, z: 0),
                    anchor: UnitPoint.bottom,
                    anchorZ:0,
                    perspective: -0.5 // 원근법
                )
                .offset(x: 0, y: -(getHeight/2))

            LazyHStack(spacing : 10){
                getView
            }
            .offset(x: 0, y: -(getHeight/5)*2)
        }
        .frame(
            width: getWidth,
            height:  (getWidth / 20) * 2
        )
    }
}

