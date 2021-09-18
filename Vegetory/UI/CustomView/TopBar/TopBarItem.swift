//
//  TopBarItem.swift
//  Vegetory
//
//  Created by 이주연 on 2021/09/17.
//

import SwiftUI

struct TopBarItem: View {
    var setModel : TopBarModel
    var setHeight : CGFloat
    var setFontSize : CGFloat
    var setWhenClick : (TopBarModel) -> Void?
    
    var body: some View {
        Text(setModel.titleNativ)
            .frame(
                height : setHeight,
                alignment: Alignment.center
            )
            .font(.custom("KOTRA_BOLD", size: setFontSize))
            .padding(.horizontal, 10)
            .onTapGesture {
                setWhenClick(setModel)
            }
            .onAppear{
               checkFonts()
            }
    }
    
    private func checkFonts(){
        for family : String in UIFont.familyNames {
            print("family : \(family)")
            for fontName : String in
                UIFont.fontNames(forFamilyName: family){
                print("=== font \(fontName)")
            }
        }
    }
}
