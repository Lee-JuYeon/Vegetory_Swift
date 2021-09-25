//
//  Strings.swift
//  Vegetory
//
//  Created by 이주연 on 2021/09/18.
//

import SwiftUI

extension String {
    var VIEW_TYPE_MAIN : String { return "MAIN" }
    var VIEW_TYPE_POST : String { return "POST" }
    var VIEW_TYPE_PROFILE : String { return "PROFILE" }


    var TOPBAR_TYPE_PROFILE : String { return "프로필" }
    var TOPBAR_TYPE_ALERT : String { return "알림" }
    var TOPBAR_TYPE_NOTICE : String { return "공지사항" }
    var TOPBAR_TYPE_SETTING : String { return "설정" }
    
    func toDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MMMM d일 a h시 m분" // 2020.08.13 오후 04시 30분
        dateFormatter.locale = Locale(identifier: "ko_KR") // PM, AM을 언어에 맞게 setting (ex: PM -> 오후)
        if let date = dateFormatter.date(from: self) {
            return date
        }else {
            return nil
        }
    }
}

