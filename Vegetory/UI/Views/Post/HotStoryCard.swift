//
//  HotStoryCard.swift
//  Vegetory
//
//  Created by 이주연 on 2021/09/30.
//

import SwiftUI

struct HotStoryCard : View {
    private var getWidth : CGFloat
    private var getHeight : CGFloat
    private var getModel : PostModel
    
    init(
        setWidth : CGFloat,
        setHeight : CGFloat,
        setModel : PostModel
    ) {
        self.getWidth = setWidth
        self.getHeight = setHeight
        self.getModel = setModel
    }
    
    
    @State private var speakerON : Bool = false
    
    var body : some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.darkPink)
                .frame(width: getWidth, height: getHeight)
                .overlay(
                    SpeakerView(
                        setWidth: getWidth,
                        setHeight: getHeight,
                        isON: $speakerON)
                )
                
            
            RoundedRectangle(cornerRadius: 10)
                .trim(from: -0.25, to: 0.75)
                .stroke(Color.white, lineWidth: 2)
                .frame(width: getWidth, height: getHeight)

        }
        .frame(width: getWidth, height: getHeight)
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))

        
            
    }
}
