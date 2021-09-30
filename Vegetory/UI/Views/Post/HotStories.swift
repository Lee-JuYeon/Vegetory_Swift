//
//  HotStories.swift
//  Vegetory
//
//  Created by 이주연 on 2021/09/30.
//

import SwiftUI


struct HotStories : View {
    private var getWidth : CGFloat
    private var getHeight : CGFloat
    
    init(
        setWidth : CGFloat,
        setHeight : CGFloat
    ) {
        self.getWidth = setWidth
        self.getHeight = setHeight
    }
    
    private let cardList = PostModel.dummyPostModelList
    var body: some View {
        RecyclerView(
            setAxis: RecyclerViewAxis.HORIZONTAL,
            setShowBar: false,
            setSpacing: 0,
            setHorizontalAlignment: HorizontalAlignment.leading,
            setVerticalAlignment: VerticalAlignment.center,
            setContent: {
                ForEach(cardList){ item in
                    HotStoryCard(
                        setWidth: getWidth/4,
                        setHeight: getHeight,
                        setModel: item
                    )
                }
            }
        )
    }
    
}
