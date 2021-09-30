//
//  ReplyModel.swift
//  Vegetory
//
//  Created by 이주연 on 2021/09/30.
//

import SwiftUI

struct ReplyModel : Identifiable {
    var id = UUID()
    var userName : String // user name
    var userSelfie : String // user selfie
    var userDescription : String // user reply string
    var replyDate : String // reply date
}
