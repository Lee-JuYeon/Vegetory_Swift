//
//  BottomSheetView.swift
//  Vegetory
//
//  Created by 이주연 on 2021/10/01.
//

import SwiftUI

struct BottomSheetView<InnerView : View>: View {
    @ViewBuilder private var getContent : InnerView
    @Binding private var getShow: Bool
    private var getWhenDismiss : () -> Void
    private var getRadius : CGFloat

    init(
        setShow : Binding<Bool>,
        setRadius : CGFloat,
        setWhenDismiss : @escaping () -> Void,
        @ViewBuilder setContent : @escaping () -> InnerView
    ) {
        self.getContent = setContent()
        self.getWhenDismiss = setWhenDismiss
        self._getShow = setShow
        self.getRadius = setRadius
    }

    var body: some View {
        ZStack {
            if getShow {
                // BottomSheet background color
                Color.black.opacity(getShow ? 0.2 : 0).edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        getWhenDismiss()
                        getShow = false
                    }

                // BottomSheet Window TopBar
                VStack(
                    alignment: HorizontalAlignment.center,
                    spacing: 0
                ) {
                    Rectangle()
                        .fill(Color.yellow)
                        .frame(
                            width: 100,
                            height: 20
                        )
                    
                    getContent   
                }
                .background(BlurView(effect: .systemUltraThinMaterialLight))
                .customCornerRadius(radius: getRadius, corners: [.topLeft, .topRight])
                .padding(EdgeInsets(top: 30, leading: 5, bottom: 0, trailing: 5))
            }
        }
    }
}

