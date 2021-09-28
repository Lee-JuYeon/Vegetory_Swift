//
//  LeftDoorBack.swift
//  Vegetory
//
//  Created by 이주연 on 2021/09/28.
//

import SwiftUI

struct LeftDoorBack: View {
    
    let getWidth : CGFloat
    let getHeight : CGFloat
    
    var body: some View {
        LazyVStack{
            Text("")
            ForEach(itemList()){ item in
                Text(item.titleNativ)
            }
        }
        .frame(
            width: getWidth/2,
            height: getHeight
        )
        .modifier(RefrigeratorBackDoorDesgin())
    }
    
    private func itemList() -> [RefrigeratorBucketModel]{
        return [
            RefrigeratorBucketModel(titleEng: "", titleNativ: "재료수정"),
            RefrigeratorBucketModel(titleEng: "", titleNativ: "재료구입"),
            RefrigeratorBucketModel(titleEng: "", titleNativ: "밀키트"),
            RefrigeratorBucketModel(titleEng: "", titleNativ: "완제품")
        ]
    }
}
