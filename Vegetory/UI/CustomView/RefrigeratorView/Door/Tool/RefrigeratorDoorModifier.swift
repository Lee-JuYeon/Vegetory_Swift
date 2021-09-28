//
//  ExtensionRefrigerator.swift
//  Vegetory
//
//  Created by 이주연 on 2021/09/28.
//

import SwiftUI

struct RefrigeratorBackDoorDesgin : ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                LinearGradient(
                    gradient: Gradient(
                        colors: [
                            Color.white,
                            Color("ReceiptGradientLight"),
                            Color("ReceiptToolColour"),
                            Color("ReceiptGradientDark"),
                            Color("ReceiptShadow"),
                            Color("ReceiptToolHoleColour")
                        ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .border(
                LinearGradient(
                    gradient: Gradient(
                        colors: [
                            Color("DoorLight"),
                            Color("DoorMiddle"),
                            Color("DoorDark"),
                            Color.black
                        ]),
                    startPoint: .top,
                    endPoint: .bottom
                ),
                width: 5
            )
    }
}
