//
//  RecieptItemModel.swift
//  Vegetory
//
//  Created by 이주연 on 2021/09/24.
//

import SwiftUI

struct ReceiptItemModel : Identifiable {
    var id = UUID()
    var count : Int
    var productTitle : String
    var productUID : String
    var productImage : String
    var productPrice : Int
}
