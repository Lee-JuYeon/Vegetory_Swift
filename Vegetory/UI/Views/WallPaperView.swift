//
//  MainView.swift
//  Vegetory
//
//  Created by 이주연 on 2021/09/17.
//

import SwiftUI

struct WallPaperview: View {
    
    
    @ObservedObject var mainVM = MainViewVM()
    
    private func setTopBarClickEvent(model : TopBarModel){
        switch model.titleEng {
        case "NOTICE":
            print("NOTICE가 클릭됨")
        case "SETTING":
            print("SETTING이 클릭됨")
        default:
            print("개발잡니다.")
        }
    }
    
    private func setMenuClickEvent(model : MainMenuModel){
        switch model.title {
        case "영수증":
            print("영수증이 클릭됨")
        case "밀키트":
            print("밀키트가 클릭됨")
        case "완제품":
            print("완제품이 클릭됨")
        case "이용내역":
            print("이용내역보기")
        default:
            print("디폴트")
        }
    }
    
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
                        
                        RefrigeratorView(
                            setWidth: 160,
                            setHeight: 325,
                            setSide : 20,
                            setDoorType : .LEFT
                        )
                        
                        
                        MainMenuView(
                            setGeo: geo,
                            setWhenClick: { item in
                                setMenuClickEvent(model: item)
                            }
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
}

