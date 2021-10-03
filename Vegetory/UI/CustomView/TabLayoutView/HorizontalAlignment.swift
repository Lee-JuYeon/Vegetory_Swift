//
//  HorizontalAlignment.swift
//  Vegetory
//
//  Created by 이주연 on 2021/10/03.
//

import SwiftUI


//Tab bar
extension HorizontalAlignment {
    private enum UnderlineLeading: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return d[.leading]
            
        }
    }

    static let underlineLeading = HorizontalAlignment(UnderlineLeading.self)
}

