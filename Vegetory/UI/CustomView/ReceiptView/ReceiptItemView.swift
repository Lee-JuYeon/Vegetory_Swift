//
//  ReceiptItemView.swift
//  Vegetory
//
//  Created by 이주연 on 2021/09/24.
//

import SwiftUI

struct ReceiptItemView: View {
    var getModel : ReceiptModel
    var getWhenItemClick : (String) -> Void
    

    
    var body: some View {
        VStack(alignment: HorizontalAlignment.center){
            DashLine(width: 5, height: 1)
            Text("\(getModel.date)")
                .foregroundColor(Color.black)
                .font(.custom("KOTRA_BOLD", size: 15))            
        
            LazyVStack(alignment : HorizontalAlignment.leading){
                ForEach(getModel.shoppingList){ model in
                    ReceiptListItem(
                        productImage: model.productImage,
                        productName: model.productTitle,
                        productPrice: model.productPrice,
                        count: model.count
                    )
                }
            }

            
            Text("총합 : \(getTotalPrice(list: getModel))원")
        }
        .padding(.horizontal, 10)
        .onTapGesture {
            getWhenItemClick(getModel.userUID)
        }
    }
    
    private func getTotalPrice(list : ReceiptModel) -> Int{
        var price = 0
        for item in list.shoppingList {
            price = price + item.productPrice
        }
        return price
    }
    
    private func getSafeTotalPrice(list : ReceiptModel) throws -> Int{
        do{
            var price = 0
            for item in list.shoppingList {
                price = try price + item.productPrice
            }
            return price
        }catch {
            print("ReceiptView, getTotalPrice / Err ")
        }
    }
}

