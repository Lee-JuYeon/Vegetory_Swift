//
//  RecieptView.swift
//  Vegetory
//
//  Created by 이주연 on 2021/09/24.
//

import SwiftUI

struct ReceiptView: View {
    
    @Binding private var getShows : Bool
    private var getWidth : CGFloat
    private var getHeight : CGFloat
    private var getWhenItemClick : (String) -> Void
    init(
        setShows : Binding<Bool>,
        setWidth : CGFloat,
        setHeight : CGFloat,
        setWhenItemClick : @escaping (String) -> Void
    ){
        self._getShows = setShows
        self.getWidth = setWidth
        self.getHeight = setHeight
        self.getWhenItemClick = setWhenItemClick
    }
    private let getPadding : CGFloat = 50
    private let circleSize : CGFloat = 10

    var body: some View {
        ZStack{
            if getShows {
                // PopUp background color
                Color.black.opacity(getShows ? 0.2 : 0).edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        getShows = false
                    }
                
                // 영수증 나오는 뷰
                Text("돋보기 이미지")
                    .frame(
                        width : getWidth,
                        height : getHeight,
                        alignment: .top
                    )
                    .background(
                        ZStack{
                            Color("ReceiptToolColour")
                            // 좌상단
                            Circle()
                                .fill(Color.yellow)
                                .frame(
                                    width : circleSize,
                                    height : circleSize,
                                    alignment : Alignment.topLeading
                                )
                                .offset(x: -getWidth/2 + circleSize, y: -getHeight/2 + circleSize)
                            // 좌하단
                            Circle()
                                .fill(Color.yellow)
                                .frame(
                                    width : circleSize,
                                    height : circleSize,
                                    alignment : Alignment.topLeading
                                )
                                .offset(x: -getWidth/2 + circleSize, y: getHeight/2 - circleSize)
                            // 우상단
                            Circle()
                                .fill(Color.yellow)
                                .frame(
                                    width : circleSize,
                                    height : circleSize,
                                    alignment : Alignment.topLeading
                                )
                                .offset(x: getWidth/2 - circleSize, y: -getHeight/2 + circleSize)
                            // 우하단
                            Circle()
                                .fill(Color.yellow)
                                .frame(
                                    width : circleSize,
                                    height : circleSize,
                                    alignment : Alignment.topLeading
                                )
                                .offset(x: getWidth/2 - circleSize, y: getHeight/2 - circleSize)
                        }
                    )
                    .border(Color("ReceiptToolHoleColour"))
                    .foregroundColor(Color.black)
                    .font(.custom("KOTRA_BOLD", size: 15))
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color("ReceiptToolHoleColour"))
                            .frame(
                                width: getWidth - getPadding,
                                height: 5
                            )
                            .padding(.horizontal, getPadding)
                    )
                    .offset(x: 0, y: -100)
                    .onTapGesture {
                        getWhenItemClick("크게보기")
                    }

                
                // 영수증 리스트 뷰
                ScrollView(showsIndicators : false){
                    LazyVStack(
                        alignment: HorizontalAlignment.center, spacing: 0
                    ){
                        ForEach(ReceiptModel.DummyReceiptModel()){ model in
                            ReceiptItemView(
                                getModel : model,
                                getWhenItemClick: { receiptUID in
                                    getWhenItemClick("\(receiptUID)")
                                }
                            )
                        }
                    }
                }
                .frame(
                    width: getWidth - getPadding - 10,
                    height: 400
                )
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [
                                            Color.black,
                                            Color.white,
                                            Color("ReceiptGradientDark"),
                                            Color("ReceiptGradientDark"),
                                            Color("ReceiptGradientLight"),
                                            Color("ReceiptGradientLight"),
                                            Color("ReceiptGradientLight"),
                                            Color("ReceiptGradientLight"),
                                            Color("ReceiptGradientDark"),
                                            Color("ReceiptGradientLight"),
                                            Color("ReceiptGradientLight")]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .border(Color("ReceiptShadow"), width: 1)
                .rotation3DEffect(
                    .degrees(0), // 몇도를 회전된 상태를 보여줄거냐
                    axis: (x: 1, y:0, z: 0), // -y, -x축으로 회전시킬것이다.
                    anchor: UnitPoint.top,
                    anchorZ:0,
                    perspective: 0.5 // 원근법
                )
                .offset(x: 0, y: 100)
            }
        }
    }
}


/*
 ZStack{
     Text("크게보기")
         .frame(
             width : getWidth,
             height : getHeight,
             alignment: .top
         )
         .foregroundColor(Color.black)
         .font(.custom("KOTRA_BOLD", size: 15))
     RoundedRectangle(cornerRadius: 5)
         .fill(Color("ReceiptToolHoleColour"))
         .frame(
             width: getWidth - getPadding,
             height: 5
         )
         .padding(.horizontal, getPadding)
     
 }
 .background(Color("ReceiptToolColour"))
 .frame(
     width : getWidth,
     height : getHeight,
     alignment: .top
 )
 .background(Color("ReceiptToolColour"))
 .offset(x: 0, y: 10)
 .shadow(
     color: Color("ReceiptShadow"),
     radius: 5, x: 2, y: 2
 )
 .onTapGesture {
     getWhenItemClick("크게보기")
 }
 */
