//
//  RightDoorBack.swift
//  Vegetory
//
//  Created by 이주연 on 2021/09/28.
//

import SwiftUI

struct RightDoorBack: View {
    let getWidth : CGFloat
    let getHeight : CGFloat
    
    var body: some View {
        LazyVStack{
            Text("가능한 요리")
            RecyclerView(
                setAxis: RecyclerViewAxis.VERTICAL,
                setShowBar: false,
                setSpacing: 5,
                setContent: {
                    ForEach(getCookableMenuList()){ item in
                        Text(item.menuTitle)
                    }
                })
        }
        .frame(
            width: getWidth/2,
            height: getHeight
        )
        .modifier(RefrigeratorBackDoorDesgin())
    }
    
    private func getCookableMenuList() -> [RecipeModel]{
        return [
            RecipeModel(
                menuTitle: "알리오올리오",
                stuffList: ["마늘","두부면","올리브오일"]
            ),
            RecipeModel(
                menuTitle: "버섯피자",
                stuffList: ["또띠야","비건치즈","토마토"]
            ),
            RecipeModel(
                menuTitle: "햄버거",
                stuffList: ["비건번","비건치즈","토마토"]
            ),
            RecipeModel(
                menuTitle: "텐더",
                stuffList: ["튀김가루","비건닭가슴살","소금"]
            )
        ]
    }
}
