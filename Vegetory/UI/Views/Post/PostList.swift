//
//  PostList.swift
//  Vegetory
//
//  Created by 이주연 on 2021/09/30.
//

import SwiftUI

struct PostList: View {
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
        RecyclerView(
            setAxis: RecyclerViewAxis.VERTICAL,
            setShowBar: false,
            setSpacing: 10,
            setHorizontalAlignment: HorizontalAlignment.leading,
            setVerticalAlignment: VerticalAlignment.top,
            setContent: {
                ForEach(PostModel.dummyPostModelList){ model in
                    PostItem(
                        setModel: model,
                        setWidth: getWidth,
                        setHeight: getHeight
                    )
                }
            }
        )
        .frame(
            width: getWidth,
            height: getHeight
        )
    }
}

struct PostItem: View {
    private var getModel : PostModel
    private var getWidth : CGFloat
    private var getHeight : CGFloat
    init(
        setModel : PostModel,
        setWidth : CGFloat,
        setHeight : CGFloat
    ) {
        self.getModel = setModel
        self.getWidth = setWidth
        self.getHeight = setHeight
    }
    @State var mediaIndex = 0

    var body: some View {
        VStack(
            alignment : HorizontalAlignment.leading,
            spacing : 0
        ){
            // user selfie, name, location, posted date
            PostItemTop(setModel: getModel, setWidth: getWidth, setHeight: getHeight)
            
            // show GIF, Photo, Video(10 sec)
            PageView(
                setWidth: getWidth,
                setHeight: (getHeight/3)*2,
                setPageCount: getModel.postMedia.count,
                setCurrentIndex: $mediaIndex,
                setBackground: {
                    Color.clear
                },
                setContent: {
                    ForEach(getModel.postMedia, id: \.self){ url in
                        Rectangle()
                            .stroke(Color.black, lineWidth: 1)
                            .frame(
                                width: getWidth,
                                height: (getHeight/3)*2
                            )
                            .overlay(
                                Text(url)
                            )
                    }
                }
            )
            
            // 'save', 'reply', 'report' button
            PostItemBottom(setModel: getModel, setWidth: getWidth, setHeight: getHeight)
                        
        }
    }
}

struct PostItemTop : View {
    
    private var getModel : PostModel
    private var getWidth : CGFloat
    private var getHeight : CGFloat
    
    init(
        setModel : PostModel,
        setWidth : CGFloat,
        setHeight : CGFloat
    ) {
        self.getModel = setModel
        self.getWidth = setWidth
        self.getHeight = setHeight
    }
    
    var body: some View {
        HStack(
            alignment : VerticalAlignment.center,
            spacing : 0
        ){
           
            // selfie
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.black, lineWidth: 1)
                .frame(
                    width: 40,
                    height: 40
                )
           
            // user name & user local address
            VStack(
                alignment : HorizontalAlignment.leading
            ){
                Text(getModel.postUserName)
                    .font(.custom(FontType.NotoSans_Bold.rawValue, size: 18))

                Text(getModel.postDate)
                    .font(.custom(FontType.NotoSans_Medium.rawValue, size: 14))
            }
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .leading
            )
            .background(Color.yellow)
            
            // posted date
            Text(getModel.postDate)
                .font(.custom(FontType.NotoSans_Medium.rawValue, size: 14))
        }
        .frame(
            width: getWidth,
            height: 50
        )
        .border(Color.red, width: 1)
    }
}

struct PostItemBottom : View {
    
    private var getModel : PostModel
    private var getWidth : CGFloat
    private var getHeight : CGFloat
    
    init(
        setModel : PostModel,
        setWidth : CGFloat,
        setHeight : CGFloat
    ) {
        self.getModel = setModel
        self.getWidth = setWidth
        self.getHeight = setHeight
    }
    
    var body: some View {
        HStack(
            alignment: VerticalAlignment.center,
            spacing: 10,
            content: {
                Rectangle()
                    .fill(Color.pink)
                    .frame(
                        width: 50,
                        height: 50
                    )
                    .overlay(
                        Text("저장")
                    )
                
                Rectangle()
                    .fill(Color.pink)
                    .frame(
                        width: 50,
                        height: 50
                    )
                    .overlay(
                        Text("댓글")
                    )
            }
        )
        
    }
}
