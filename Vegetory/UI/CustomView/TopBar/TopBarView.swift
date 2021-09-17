//
//  TopBarView.swift
//  Vegetory
//
//  Created by 이주연 on 2021/09/17.
//

import SwiftUI

enum TopBarType {
    case MAIN, POST, PROFILE
}

struct TopBarView: View {
    @State var topbarList = [
        TopBarModel(titleNativ: "공지사항", titleEng: "Notice"),
        TopBarModel(titleNativ: "설정", titleEng: "Setting")
    ]
    var setHeight : CGFloat
    var setWhenClick : (TopBarModel) -> Void?
    var setType : TopBarType
    
    private func putListByType(type : TopBarType) -> [TopBarModel] {
        return swtch type {
            case TopBarType.MAIN :
        }
    }
    
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 0,
            content: {
                Divider()
                HStack{
                    ForEach(topbarList){ item in
                        TopBarItem(
                            setModel: item,
                            setHeight: (setHeight / 20) * 2,
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
            maxHeight: (setHeight / 20) * 2,
            alignment: .top
        )
    }
}

