//
//  UserAnalyticsView.swift
//  Vegetory
//
//  Created by 이주연 on 2021/10/04.
//

import SwiftUI

struct UserAnalyticsView : View {
    private var getWidth : CGFloat
    private var getHeight : CGFloat
    private var getModel : UserAnalyticsModel
     
    init(
        setWidth : CGFloat,
        setHeight : CGFloat,
        setModel : UserAnalyticsModel
    ) {
        self.getWidth = setWidth
        self.getHeight = setHeight
        self.getModel = setModel
    }
    
    var body: some View {
        LazyVStack(alignment: HorizontalAlignment.leading, spacing: 1) {
            Text(getModel.title)
                .foregroundColor(Color.black)
                .customFont(fontName: FontType.NotoSans_Bold.rawValue, fontSize: 15)
            
            Text(getModel.data)
                .foregroundColor(Color.black.opacity(0.6))
                .customFont(fontName: FontType.NotoSans_Medium.rawValue, fontSize: 13)
        }
        .frame(
            width : getWidth,
            height : getHeight,
            alignment: .leading
        )
    }
}

