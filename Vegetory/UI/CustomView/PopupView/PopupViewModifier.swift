//
//  PopupViewModifier.swift
//  Vegetory
//
//  Created by 이주연 on 2021/09/23.
//

import SwiftUI

struct PopupViewModifier<GetView : View>: ViewModifier {
    
    @ViewBuilder private var getContent : GetView
    @Binding private var getShow: Bool
    private var getTitle : String
    private var getWhenDismiss : Void
   
    
 
    init(
        setTitle : String,
        setShow : Binding<Bool>,
        setWhenDismiss : @escaping () -> Void,
        @ViewBuilder setContent : @escaping () -> GetView
    ) {
        self.getContent = setContent()
        self.getWhenDismiss = setWhenDismiss()
        self._getShow = setShow
        self.getTitle = setTitle
        
    }
    
    @ViewBuilder private func popupContent() -> some View {
        ZStack{
            if getShow{
                // PopUp background color
                Color.black.opacity(getShow ? 0.13 : 0).edgesIgnoringSafeArea(.all)
                
                getContent
                    
            }
        }
    }
  
    func body(content: Content) -> some View {
        content
            .overlay(popupContent())
    }
   
      
}

/*
 https://www.vadimbulavin.com/swiftui-popup-sheet-popover/
 */
