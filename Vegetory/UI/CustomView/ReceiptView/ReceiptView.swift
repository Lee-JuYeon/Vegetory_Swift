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
                Rectangle()
                    .fill(Color("ReceiptToolColour"))
                    .frame(
                        width : getWidth,
                        height : getHeight
                    )
                    .overlay(
                        ZStack{
                            LazyHStack{
                                Text("전체보기")
                                    .foregroundColor(Color.black)
                                    .font(.custom("NotoSansKR-Bold", size: 17))
                                Image("image_calendar")
                                    .resizable()
                                    .frame(
                                        width : 25,
                                        height: 25
                                    )
                            }
                            .offset(y: -getHeight/3)
                            .onTapGesture {
                                getShows = false
                                print("popupview로 주문내역 확인")
                            }
                            
                            // 좌상단
                            ReceiptScrew(setCircleSize : circleSize)
                                .offset(
                                    x: -getWidth/2 + circleSize,
                                    y: -getHeight/2 + circleSize
                                )
                           
                            // 좌하단
                            ReceiptScrew(setCircleSize : circleSize)
                                .offset(
                                    x: -getWidth/2 + circleSize,
                                    y: getHeight/2 - circleSize
                                )

                            // 우상단
                            ReceiptScrew(setCircleSize : circleSize)
                                .offset(
                                    x: getWidth/2 - circleSize,
                                    y: -getHeight/2 + circleSize
                                )
                            
                            // 우하단
                            ReceiptScrew(setCircleSize : circleSize)
                                .offset(
                                    x: getWidth/2 - circleSize,
                                    y: getHeight/2 - circleSize
                                )
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
                RecyclerView(
                    setAxis: .VERTICAL,
                    setShowBar: false,
                    setSpacing: 0,
                    setHorizontalAlignment : HorizontalAlignment.leading,
                    setContent: {
                        ForEach(ReceiptModel.DummyReceiptModel()){ model in
                            ReceiptCell(
                                getModel : model,
                                getWhenItemClick: { receiptUID in
                                    getWhenItemClick("\(receiptUID)")
                                }
                            )
                        }
                    }
                )
                .background(Color.white)
                .frame(
                    width: getWidth - getPadding - 10,
                    height : 400
                )
                .border(Color("ReceiptShadow"), width: 1)
                .offset(x: 0, y: 100)
                .onAppear {
                    sortByReceiptList()
                }
            }
        }
    }
    private func sortByReceiptList(){
        let isoFormatter = DateFormatter()
        isoFormatter.dateFormat = "yyyy-MM-dd hh:mm"
        
        let receiptList = ReceiptModel.DummyReceiptModel()
        let dateList = receiptList.compactMap{
            let result = isoFormatter.date(from: $0.date)
            print("result : \(result)")
        }
        let sortedDateList = dateList.sorted { $0 > $1 }

    }
}

