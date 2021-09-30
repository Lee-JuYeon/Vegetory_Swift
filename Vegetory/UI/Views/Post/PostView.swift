//
//  PostView.swift
//  Vegetory
//
//  Created by 이주연 on 2021/09/28.
//

import SwiftUI
/*
 top bar items
  1. 유저 검색
  2. 포스트 올리기
 */

struct PostView: View {
    
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
        let heightBlock = getHeight / 20
        LazyVStack(
            alignment : HorizontalAlignment.center,
            spacing : 20
        ){
            HotStories(
                setWidth: getWidth,
                setHeight: heightBlock * 4
            )
            PostList(
                setWidth: getWidth,
                setHeight: heightBlock * 15
            )
        }
        .modifier(MaxSize())
    }
}



