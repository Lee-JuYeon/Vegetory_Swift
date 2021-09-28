//
//  DockView.swift
//  Vegetory
//
//  Created by 이주연 on 2021/09/25.
//

import SwiftUI

struct DockView<GETITEMS : View, GETPLATEVIEW : View>: View {
    private var getWidth : CGFloat
    private var getHeight : CGFloat
    private var getItems : GETITEMS
    private var getPlateView : GETPLATEVIEW
    
    init(
        setWidth : CGFloat,
        setHeight : CGFloat,
        @ViewBuilder setPlateView : @escaping () -> GETPLATEVIEW,
        @ViewBuilder setItems : @escaping () -> GETITEMS
    ) {
        self.getWidth = setWidth
        self.getHeight = setHeight
        self.getItems = setItems()
        self.getPlateView = setPlateView()
    }
    
    var body: some View {
        let heightBlock = -getHeight/10
        ZStack{
            getPlateView
                .frame(
                    width: getWidth - 10,
                    height:  getHeight
                )
                .rotation3DEffect(
                    .degrees(-60), // 몇도를 회전된 상태를 보여줄거냐
                    axis: (x: 1, y:0, z: 0),
                    anchor: UnitPoint.bottom,
                    anchorZ:0,
                    perspective: -0.5 // 원근법
                )
                .offset(
                    x: 0,
                    y: heightBlock * 1
                )

            LazyHStack(spacing : 10){
                getItems
            }
            .offset(
                x: 0,
                y: heightBlock * 5
            )
        }
        .frame(
            width: getWidth,
            height: getHeight
        )
    }
}

