//
//  RefrigeratorBucketView.swift
//  Vegetory
//
//  Created by 이주연 on 2021/09/23.
//

import SwiftUI

struct RefrigeratorBucketView: View {
    private let getModel : RefrigeratorBucketModel
    private let getWidth : CGFloat
    private let getHeight : CGFloat
    
    init(
        setModel : RefrigeratorBucketModel,
        setWidth : CGFloat,
        setHeight : CGFloat
    ) {
        self.getModel = setModel
        self.getWidth = setWidth - 20
        self.getHeight = setHeight
    }
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.white.opacity(0.0))
                .background(
                    BlurView(effect: .systemUltraThinMaterialDark)
                )
            
            Text(getModel.titleNativ)
                .foregroundColor(.white)
                .font(.custom("ImcreSoojin OTF", size: 15))

        }
        .frame(
            width: getWidth,
            height: getHeight,
            alignment: .center
        )
        .border(Color.black, width: 1)
        .onTapGesture {
            setWhenClick(model: getModel)
        }
    }
    
    private func setWhenClick(model : RefrigeratorBucketModel){
        
    }
}

