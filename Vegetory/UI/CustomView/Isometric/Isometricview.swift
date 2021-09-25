//
//  Isometricview.swift
//  Vegetory
//
//  Created by 이주연 on 2021/09/21.
//

import SwiftUI

struct IsometricView<GetView: View>: View {
    
    private var getView : GetView
    private var getSize : CGFloat
    private var getColour : Color
    private var getDepth : CGFloat
    
    init(
        @ViewBuilder setView : @escaping () -> GetView,
        setColour : Color,
        setSize : CGFloat,
        setDepth : CGFloat
    ) {
        self.getView = setView()
        self.getColour = setColour
        self.getSize = setSize
        self.getDepth = setDepth
    }
    
    var body: some View {
        ZStack{
            //top
            Rectangle()
                .fill(getColour)
                .frame(height:getDepth)
                .rotation3DEffect(
                    Angle(degrees: 360),
                    axis: (x: 1.0, y: 0.0, z: 0.0),
                    anchor: .bottom,
                    anchorZ: 0.0,
                    perspective: 0
                )
                .projectionEffect(
                    ProjectionTransform(
                        CGAffineTransform(
                            a: 1,
                            b: 0,
                            c: 1,
                            d: -1, // 넓이
                            tx: 0, // x축으로 이동
                            ty: getDepth/2 //y축으로 이동
                        )
                    )
                )
                .offset(x: 0, y: -getSize/2 + 1)
            
            //right
            Rectangle()
                .fill(getColour)
                .background(
                    LinearGradient(
                        gradient: Gradient(
                            colors: [
                                .white,
                                Color("ReceiptToolColour")
                            ]
                        ),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .brightness(-0.2)
                .offset(x: getSize/2 + getDepth/2, y: getSize/2 + ((getDepth/5)*3))
                .frame(width:getDepth, height:getSize)
                .rotation3DEffect(
                    Angle(degrees: 0),
                    axis: (x: 0, y: 1, z: 0),
                    anchor: .bottom,
                    anchorZ: 0.0,
                    perspective: 1
                )
                .projectionEffect(
                    ProjectionTransform(
                        CGAffineTransform(
                            a: 1,
                            b: -1,
                            c: 0,
                            d: 1,
                            tx: 0,
                            ty: -1
                        )
                    )
                )

            //front
            getView
                .frame(
                    width: getSize,
                    height: getSize
                )
        }
    }
}


/*
 ZStack{
     //front
     Rectangle()
         .stroke(Color.red, lineWidth: 2)
         .frame(
             width: getSize,
             height: getSize
         )
     //top
     Rectangle()
         .stroke(Color.blue, lineWidth: 2)
         .frame(
             width: getSize,
             height: getSize
         )
         .rotation3DEffect(
             .degrees(-60), // 몇도를 회전된 상태를 보여줄거냐
             axis: (x: 1, y:0, z: 0),
             anchor: UnitPoint.bottom,
             anchorZ:0,
             perspective: -0.5 // 원근법
         )
         .offset(x: 0, y: -getSize)
     //right
 }
 
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
 */
