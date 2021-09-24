//
//  ReceiptScrew.swift
//  Vegetory
//
//  Created by 이주연 on 2021/09/25.
//

import SwiftUI


struct ReceiptScrew: View {
    
    var setCircleSize : CGFloat
    
    var body: some View {
        Circle()
            .strokeBorder(Color("ReceiptToolHoleColour"), lineWidth : 1)
            .background(
                Circle()
                    .fill(
                        AngularGradient(
                            gradient : Gradient(
                                colors : [
                                    Color("ReceiptToolHoleColour"),
                                    Color("ReceiptShadow"),
                                    Color("ReceiptGradientDark"),
                                    Color("ReceiptToolColour"),
                                    Color("ReceiptGradientLight"),
                                    Color.white,
                                    Color("ReceiptGradientLight"),
                                    Color("ReceiptToolColour"),
                                    Color("ReceiptGradientDark"),
                                    Color("ReceiptShadow"),
                                    Color("ReceiptToolHoleColour"),
                                    Color("ReceiptToolHoleColour"),
                                    Color("ReceiptShadow"),
                                    Color("ReceiptGradientDark"),
                                    Color("ReceiptToolColour"),
                                    Color("ReceiptGradientLight"),
                                    Color.white,
                                    Color("ReceiptGradientLight"),
                                    Color("ReceiptToolColour"),
                                    Color("ReceiptGradientDark"),
                                    Color("ReceiptShadow"),
                                    Color("ReceiptToolHoleColour")
                                ]
                            ),
                            center: .center
                        )
                    )
            )
            .frame(
                width : setCircleSize,
                height : setCircleSize
            )
    }
}
