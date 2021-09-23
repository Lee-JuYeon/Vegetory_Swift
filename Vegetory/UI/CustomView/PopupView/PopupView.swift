//
//  PopupView.swift
//  Vegetory
//
//  Created by 이주연 on 2021/09/23.
//

import SwiftUI

struct PopupView<Content : View>: View {
    
    @ViewBuilder private var getContent : Content
    @Binding private var getShow: Bool
    private var getTitle : String
    private var getWhenDismiss : Void

    init(
        setTitle : String,
        setShow : Binding<Bool>,
        setWhenDismiss : @escaping () -> Void,
        @ViewBuilder setContent : @escaping () -> Content
    ) {
        self.getContent = setContent()
        self.getWhenDismiss = setWhenDismiss()
        self._getShow = setShow
        self.getTitle = setTitle
        
    }

    var body: some View {
        ZStack {
            if getShow {
                // PopUp background color
                Color.black.opacity(getShow ? 0.2 : 0).edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        getWhenDismiss
                        getShow = false
                    }

                // PopUp Window TopBar
                VStack(
                    alignment: HorizontalAlignment.center,
                    spacing: 0
                ) {
                    HStack(
                        alignment: VerticalAlignment.center,
                        spacing: 0
                    ){
                        Text(getTitle)
                            .foregroundColor(Color("LightLightShadow"))
                            .font(.custom("KOTRA_BOLD", size: 17))
                            .frame(
                                minWidth: 0,
                                maxWidth: .infinity,
                                minHeight: 0,
                                idealHeight: 20,
                                maxHeight: 20,
                                alignment: .center
                            )
                        Rectangle()
                            .fill(Color("DismissColour"))
                            .cornerRadius(8)
                            .onTapGesture {
                                getWhenDismiss
                                getShow = false
                            }
                            .frame(
                                width: 20,
                                height: 20,
                                alignment: .trailing
                            )
                            .padding(.all, 6)
                    }
                    .background(BlurView(effect: .systemUltraThinMaterialDark))
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 0,
                        idealHeight: 30,
                        maxHeight: 30,
                        alignment: .center
                    )
                    .customCornerRadius(radius: 10, corners: .topLeft)
                    .customCornerRadius(radius: 10, corners: .topRight)
                    
                    getContent
                        .background(BlurView(effect: .systemUltraThinMaterialLight))
                        .frame(
                            minWidth: 0,
                            maxWidth: .infinity,
                            minHeight: 0,
                            maxHeight: .infinity,
                            alignment: .center
                        )
                }
            }
        }
    }
      
}

/*
 https://www.vadimbulavin.com/swiftui-popup-sheet-popover/
 */
