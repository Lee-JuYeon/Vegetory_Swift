//
//  ProfileView.swift
//  Vegetory
//
//  Created by 이주연 on 2021/10/04.
//

import SwiftUI

/*
 topbar : 프로필수정, 팔로우, 언팔, 포스트 추가, 인증하기
 */
struct ProfileView: View {
    
    private var getWidth : CGFloat
    private var getHeight : CGFloat
     
    init(
        setWidth : CGFloat,
        setHeight : CGFloat
    ) {
        self.getWidth = setWidth
        self.getHeight = setHeight
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(alignment: HorizontalAlignment.leading, spacing: 20) {
                HStack(alignment: VerticalAlignment.center, spacing: 10) {
                    // Selfie
                    Circle()
                        .fill(Color.yellow)
                        .frame(width: getWidth / 4, height: getWidth / 4)
                    
                    VStack(alignment: HorizontalAlignment.leading, spacing: 15) {
                        // User Name
                        ScrollView(.horizontal, showsIndicators: false) {
                            Text("name/이름/NAME")
                                .customFont(fontName: FontType.ImcreSoojin.rawValue, fontSize: 25)
                                .frame(alignment : .leading)
                        }

                        // Following, Follower, Re-Buying Rate
                        HStack(alignment: VerticalAlignment.center, spacing: 3) {
                            ForEach(getAnalytics(), id: \.self){ model in
                                UserAnalyticsView(
                                    setWidth: getWidth / 5,
                                    setHeight: getWidth / 16,
                                    setModel: model
                                )
                            }
                        }
                    }
                }
                .padding(.all, 10)
                
                // 자주 사고파는 품목
                LazyVStack(alignment: HorizontalAlignment.leading, spacing: 5) {
                    Text("주거래 품목")
                        .customFont(fontName: FontType.NotoSans_Bold.rawValue, fontSize: 23)
                    VStack(alignment : HorizontalAlignment.leading, spacing: 5){
                        //구매
                        Text("구매")
                        RecyclerView(
                            setAxis: RecyclerViewAxis.HORIZONTAL,
                            setShowBar: false,
                            setSpacing: 5,
                            setHorizontalAlignment: HorizontalAlignment.leading,
                            setVerticalAlignment: VerticalAlignment.center) {
                                ForEach(getDummyBuyingList, id:\.self){ boughtProduct in
                                    Text(boughtProduct)
                                }
                        }
                        //판매
                        Text("판매")
                        RecyclerView(
                            setAxis: RecyclerViewAxis.HORIZONTAL,
                            setShowBar: false,
                            setSpacing: 5,
                            setHorizontalAlignment: HorizontalAlignment.leading,
                            setVerticalAlignment: VerticalAlignment.center) {
                                ForEach(getDummySeelingList, id:\.self){ soldProduct in
                                    Text(soldProduct)
                                }
                        }
                    }
                }
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
                
                // 거래 후기
                LazyVStack(alignment: HorizontalAlignment.leading, spacing: 5) {
                    Text("거래 후기")
                        .customFont(fontName: FontType.NotoSans_Bold.rawValue, fontSize: 23)
                    RecyclerView(
                        setAxis: RecyclerViewAxis.HORIZONTAL,
                        setShowBar: false,
                        setSpacing: 5,
                        setHorizontalAlignment: HorizontalAlignment.leading,
                        setVerticalAlignment: VerticalAlignment.center) {
                            ForEach(getDummyReviewCards(), id:\.self){ reviewModel in
                                ReviewCardView(
                                    setWidth: getWidth/3,
                                    setHeight: getHeight/3,
                                    setModel: reviewModel
                                )
                            }
                    }
                }
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))

                // post
                LazyVStack(alignment: HorizontalAlignment.leading, spacing: 5) {
                    Text("Post")
                        .customFont(fontName: FontType.NotoSans_Bold.rawValue, fontSize: 23)
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                    PostList(
                        setWidth: getWidth,
                        setHeight: (getHeight / 20) * 15,
                        setWhenItemButtonClick: { model in
//                            getWhenReplyClick(model)
                        },
                        setWhenSelfieClick: { userUID in
//                            getWhenProfileClick(userUID)
                        }
                    )
                }
                
                // cctv
                
            }
        }
    }
    
    private func getAnalytics() -> [UserAnalyticsModel] {
        return [
            UserAnalyticsModel(title: "팔로잉", data: "1248914"),
            UserAnalyticsModel(title: "팔로워", data: "142444"),
            UserAnalyticsModel(title: "재구매율", data: "16%")
        ]
    }
    
    private let getDummyBuyingList = ["사과", "복숭아", "딸기", "수박", "포도"]
    private let getDummySeelingList = ["샤인 머스켓", "케모마일", "꿀"]
    
    private func getDummyReviewCards() -> [ReviewModel] {
        return [
            ReviewModel(
                userName: "Sin세경",
                userSelfie: "selfie",
                reviewUID: "uid1",
                reviewProduct: ["사과"],
                reviewDescription: "사과가 생각보다 너무 달아서 굉장히 만족했어요! 다음에 또 시킬 생각입니다 ㅎㅎ",
                reviewRate: "5"),
            ReviewModel(
                userName: "박효신",
                userSelfie: "selfie",
                reviewUID: "uid1",
                reviewProduct: ["배", "도라지"],
                reviewDescription: "목이 요즘 너무 안좋아서 주문했는데, 굉장히 만족하고 있습니다.",
                reviewRate: "4"),
            ReviewModel(
                userName: "박한별",
                userSelfie: "selfie",
                reviewUID: "uid1",
                reviewProduct: ["곶감","돼지고기","소고기"],
                reviewDescription: "소고기는 생각보다 너무 질겨서 다 못먹고 버렸네요..",
                reviewRate: "1"),
            ReviewModel(
                userName: "박진영",
                userSelfie: "selfie",
                reviewUID: "uid1",
                reviewProduct: ["김", "떡", "배", "사과","쌀"],
                reviewDescription: "김이 생각보다 맛있네요",
                reviewRate: "4"),
            ReviewModel(
                userName: "신대철",
                userSelfie: "selfie",
                reviewUID: "uid1",
                reviewProduct: ["포도"],
                reviewDescription: "맛있어요",
                reviewRate: "3")
        ]
    }
}

struct ReviewModel : Hashable {
    var userName : String
    var userSelfie : String
    var reviewUID : String
    var reviewProduct : [String]
    var reviewDescription : String
    var reviewRate : String
}

struct ReviewCardView : View {
    
    private var getWidth : CGFloat
    private var getHeight : CGFloat
    private var getModel : ReviewModel
     
    init(
        setWidth : CGFloat,
        setHeight : CGFloat,
        setModel : ReviewModel
    ) {
        self.getWidth = setWidth
        self.getHeight = setHeight
        self.getModel = setModel
    }
    
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.yellow)
            .frame(
                width: getWidth,
                height: getHeight,
                alignment: .center
            )
            
    }
}
