//
//  ReceiptListItem.swift
//  Vegetory
//
//  Created by 이주연 on 2021/09/24.
//

import SwiftUI

struct ReceiptProductCell: View {
    var productImage : String
    var productName : String
    var productPrice : Int
    var count : Int
    
    var body: some View {
        HStack(alignment : VerticalAlignment.center){
            Text("\(productName) x\(count)")
                .font(.custom("NotoSansKR-Bold", size: 13))
                .frame(
                    alignment:.leading
                )
            
            Text("\(productPrice)원")
                .font(.custom("NotoSansKR-Medium", size: 13))
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    idealHeight: 18,
                    maxHeight: 18,
                    alignment: Alignment.trailing
                )
        }
        .frame(
            minWidth: 0,
            idealWidth: 50,
            maxWidth: .infinity,
            minHeight: 0,
            idealHeight: 18,
            maxHeight: 18,
            alignment: Alignment.leading
        )
    }
}
