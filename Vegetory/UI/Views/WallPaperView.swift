//
//  MainView.swift
//  Vegetory
//
//  Created by 이주연 on 2021/09/17.
//

import SwiftUI

struct WallPaperview: View {
    
    
    @ObservedObject var mainVM = MainViewVM()
    @State private var showPopupView : Bool = false
    
    var body: some View {
        GeometryReader{ geo in
            ZStack{
                VStack(
                    alignment: .center,
                    spacing: 0,
                    content: {
                        // TopBar View
                        TopBarView(
                            setType : .MAIN,
                            setHeight : geo.size.height,
                            setWhenClick : { item in
                                setTopBarClickEvent(model: item)
                            }
                        )
                        
                        MainView(
                            setGeo: geo
                        )
                       
                    }
                )
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .top
                )
                .background(Color("LightBackground"))
                
                PopupView(
                    setTitle: "title타이틀123",
                    setShow: $showPopupView,
                    setWhenDismiss: {
                        print("뷰가 사라짐")
                    },
                    setContent: {
                        Rectangle()
                            .stroke(Color.yellow, lineWidth: 2)
                            .frame(
                                width: 100,
                                height: 100,
                                alignment: .center
                            )
                    }
                )
            }
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .top
            )
        }
    }
    
    private func setTopBarClickEvent(model : TopBarModel){
        switch model.titleEng {
        case "NOTICE":
            print("NOTICE가 클릭됨")
            self.showPopupView = !self.showPopupView
        case "SETTING":
            print("SETTING이 클릭됨")
        default:
            print("개발잡니다.")
        }
    }
    
}

