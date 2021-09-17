//
//  Blurview.swift
//  Vegetory
//
//  Created by 이주연 on 2021/09/17.
//

import Foundation
import SwiftUI

struct BlurView : UIViewRepresentable {
    var effect : UIBlurEffect.Style
    func makeUIView (context : Context) -> UIVisualEffectView{
        let blurEffect = UIBlurEffect(style: effect)
        let blurView = UIVisualEffectView(effect: blurEffect)
        return blurView
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
}

