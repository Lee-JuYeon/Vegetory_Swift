//
//  MainMenuView.swift
//  Vegetory
//
//  Created by 이주연 on 2021/09/18.
//

import SwiftUI

struct MainMenuView: View {
    var setGeo : GeometryProxy
    var setWhenClick : (MainMenuModel) -> Void
    
    var body: some View {
        // Menu View
        GridView(
            setDivide: 2,
            setGridType: GridType.VERTICAL,
            setItemtype: .flexible(minimum: 20),
            setSpacing: 5,
            setContent: {
                ForEach(MainMenuModel.MainMenuList()){ model in
                    NeomorphismView(
                        getWidth: 150,
                        getHeight: 100,
                        getRadius : 10,
                        content: {
                            VStack{
                                Text(model.title)
                                    .frame(
                                        minWidth: 0,
                                        maxWidth: .infinity,
                                        alignment: Alignment.leading
                                    )
                                    .font(.custom("ImcreSoojin OTF", size: 20))
                                    
                                Text(model.description)
                                    .frame(
                                        minWidth: 0,
                                        maxWidth: .infinity,
                                        alignment: Alignment.leading
                                    )
                                    .font(.custom("NotoSansKR-Medium", size: 15))
                                
                            }
                            .frame(
                                minWidth: 0,
                                idealWidth: (setGeo.size.width / 20) * 10,
                                maxWidth: .infinity,
                                minHeight: 0,
                                idealHeight: (setGeo.size.height / 20) * 4,
                                maxHeight: .infinity,
                                alignment: Alignment.top
                            )
                            .padding(10)
                            .onTapGesture {
                                setWhenClick(model)
                            }
                        }
                    )
                }
            }
        )
    }
}

