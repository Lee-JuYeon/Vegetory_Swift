//
//  ExtensionsCGFloat.swift
//  Vegetory
//
//  Created by 이주연 on 2021/09/18.
//

import SwiftUI

extension CGFloat {
    var getStatusBar : CGFloat {
        var statusBarHeight : CGFloat = 0
        if #available(iOS 13.0, *) {
            let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
            statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        } else {
            statusBarHeight = UIApplication.shared.statusBarFrame.height
        }
        return statusBarHeight
    }

}

