//
//  LeftDoorFront.swift
//  Vegetory
//
//  Created by 이주연 on 2021/09/28.
//

import SwiftUI

struct LeftDoorFront: View {
    let getWidth : CGFloat
    let getHeight : CGFloat
    var body: some View {
        Rectangle()
            .fill(
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
                )
            )
            .overlay(
                ZStack{
                    Rectangle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(
                                    colors: [
                                        Color("HandleTop"),
                                        Color("HandleMiddle"),
                                        Color("HandleBottom")
                                    ]),
                                startPoint: .bottomTrailing,
                                endPoint: .topLeading
                            )
                        )
                        .frame(
                            width: getWidth/2,
                            height: 3
                        )
                        .offset(
                            x: 0, y: (getHeight/16)
                        )
                    Rectangle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(
                                    colors: [
                                        Color("HandleTop"),
                                        Color("HandleMiddle"),
                                        Color("HandleBottom")
                                    ]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .frame(
                            width: 1,
                            height: getHeight
                        )
                        .offset(
                            x: getWidth/4, y: 0
                        )
                }
            )
    }
}
