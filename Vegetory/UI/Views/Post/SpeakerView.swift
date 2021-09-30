//
//  SpeakerView.swift
//  Vegetory
//
//  Created by 이주연 on 2021/09/30.
//

import SwiftUI

struct SpeakerView: View {
    private var getWidth : CGFloat
    private var getHeight : CGFloat
    @Binding private var isON : Bool
    
    init(
        setWidth : CGFloat,
        setHeight : CGFloat,
        isON : Binding<Bool>
    ) {
        self.getWidth = setWidth
        self.getHeight = setHeight
        self._isON = isON
    }
    
    var body: some View {
        let speakerWidth = getWidth / 5
        let speakerHeight = getHeight / 5
        ZStack{
            RoundedRectangle(cornerRadius: 5)
                .fill(isON == false ? Color.black : Color.white)

            VStack(
                alignment: HorizontalAlignment.center,
                spacing : 2
            ){
                Circle()
                    .stroke(Color.yellow, lineWidth: 2)
                    .frame(
                        width: (speakerWidth / 10) * 2,
                        height: (speakerHeight / 10) * 2
                    )
                Circle()
                    .stroke(Color.pink, lineWidth: 3)
                    .frame(
                        width: (speakerWidth / 10) * 4,
                        height: (speakerHeight / 10) * 4
                    )
            }
            .frame(
                width: speakerWidth,
                height: speakerHeight
            )
        }
        .frame(
            width: speakerWidth,
            height: speakerHeight
        )
    }
}
