//
//  TopBarView.swift
//  Vegetory
//
//  Created by 이주연 on 2021/09/17.
//

import SwiftUI

enum TopBarType : Int {
    case MAIN = 0
    case POST = 1
    case PROFILE = 2
}


struct TopBarView: View {
    
    var setType : TopBarType
    var setHeight : CGFloat
    var setWhenClick : (TopBarModel) -> Void?
    
    private func putListByType(type : TopBarType) -> [TopBarModel] {
        switch type {
        case TopBarType.MAIN:
            return TopBarModel.TopBarList_MAIN()
        case TopBarType.POST:
            return TopBarModel.TopBarList_POST()
        case TopBarType.PROFILE:
            return TopBarModel.TopBarList_PROFILE()
        default:
            return TopBarModel.TopBarList_MAIN()
        }
    }
    
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 0,
            content: {
                Divider()
                HStack{
                    ForEach(putListByType(type: setType)){ item in
                        TopBarItem(
                            setModel: item,
                            setHeight: (setHeight / 20) * 1,
                            setFontSize: 20
                        ) { clickedItem in
                            setWhenClick(clickedItem)
                        }
                    }
                }
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .trailing
                )
                .background(
                    BlurView(effect: .light)
                )
                Divider()
            }
        )
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: (setHeight / 20) * 1,
            alignment: .top
        )
    }
}

