//
//  Date.swift
//  Vegetory
//
//  Created by 이주연 on 2021/09/25.
//

import SwiftUI

extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MMMM d일 a h시 m분"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        return dateFormatter.string(from: self)
        
    }

}
/*
 https://formestory.tistory.com/6
 date 관련 블로그
 */
