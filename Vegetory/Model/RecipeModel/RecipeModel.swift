//
//  RecipeModel.swift
//  Vegetory
//
//  Created by 이주연 on 2021/09/28.
//

import SwiftUI

struct RecipeModel : Identifiable {
    var id = UUID()
    var menuTitle : String
    var stuffList : [String]
}

