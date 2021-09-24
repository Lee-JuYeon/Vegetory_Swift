//
//  RecieptModel.swift
//  Vegetory
//
//  Created by 이주연 on 2021/09/24.
//

import SwiftUI

struct ReceiptModel: Identifiable {
    var id = UUID()
    var userUID : String
    var date : String
    var shoppingList : [ReceiptItemModel]
    
}

extension ReceiptModel {
    static func DummyReceiptModel() -> [ReceiptModel] {
        return [
            ReceiptModel(
                userUID: "userUID1",
                date: "2021-01-02 19:19",
                shoppingList: [
                    ReceiptItemModel(
                        count: 2,
                        productTitle: "콩나물",
                        productUID: "productUID1",
                        productImage: "",
                        productPrice: 2000
                    ),
                    ReceiptItemModel(
                        count: 1,
                        productTitle: "양배추",
                        productUID: "productUID2",
                        productImage: "",
                        productPrice: 2000
                    ),
                    ReceiptItemModel(
                        count: 4,
                        productTitle: "콩고기",
                        productUID: "productUID3",
                        productImage: "",
                        productPrice: 60000
                    ),
                    ReceiptItemModel(
                        count: 2,
                        productTitle: "코코넛 오일",
                        productUID: "productUID4",
                        productImage: "",
                        productPrice: 12000
                    ),
                    ReceiptItemModel(
                        count: 1,
                        productTitle: "포도씨유",
                        productUID: "productUID4",
                        productImage: "",
                        productPrice: 60000
                    ),
                    ReceiptItemModel(
                        count: 12,
                        productTitle: "곡물 버거번",
                        productUID: "productUID5",
                        productImage: "",
                        productPrice: 6000
                    ),
                    ReceiptItemModel(
                        count: 2,
                        productTitle: "두부 퀘사디아",
                        productUID: "productUID5",
                        productImage: "",
                        productPrice: 12000
                    )
                ]
            ),
            ReceiptModel(
                userUID: "userUID1",
                date: "2021-05-02 19:19",
                shoppingList: [
                    ReceiptItemModel(
                        count: 2,
                        productTitle: "콩나물",
                        productUID: "productUID1",
                        productImage: "",
                        productPrice: 2000
                    ),
                    ReceiptItemModel(
                        count: 1,
                        productTitle: "양배추",
                        productUID: "productUID2",
                        productImage: "",
                        productPrice: 2000
                    ),
                    ReceiptItemModel(
                        count: 4,
                        productTitle: "콩고기",
                        productUID: "productUID3",
                        productImage: "",
                        productPrice: 60000
                    ),
                    ReceiptItemModel(
                        count: 2,
                        productTitle: "코코넛 오일",
                        productUID: "productUID4",
                        productImage: "",
                        productPrice: 12000
                    ),
                    ReceiptItemModel(
                        count: 1,
                        productTitle: "포도씨유",
                        productUID: "productUID4",
                        productImage: "",
                        productPrice: 60000
                    ),
                    ReceiptItemModel(
                        count: 12,
                        productTitle: "곡물 버거번",
                        productUID: "productUID5",
                        productImage: "",
                        productPrice: 6000
                    ),
                    ReceiptItemModel(
                        count: 2,
                        productTitle: "두부 퀘사디아",
                        productUID: "productUID5",
                        productImage: "",
                        productPrice: 12000
                    )
                ]
            ),
            ReceiptModel(
                userUID: "userUID1",
                date: "2021-12-12 19:19",
                shoppingList: [
                    ReceiptItemModel(
                        count: 2,
                        productTitle: "콩나물",
                        productUID: "productUID1",
                        productImage: "",
                        productPrice: 2000
                    ),
                    ReceiptItemModel(
                        count: 1,
                        productTitle: "양배추",
                        productUID: "productUID2",
                        productImage: "",
                        productPrice: 2000
                    ),
                    ReceiptItemModel(
                        count: 4,
                        productTitle: "콩고기",
                        productUID: "productUID3",
                        productImage: "",
                        productPrice: 60000
                    ),
                    ReceiptItemModel(
                        count: 2,
                        productTitle: "코코넛 오일",
                        productUID: "productUID4",
                        productImage: "",
                        productPrice: 12000
                    ),
                    ReceiptItemModel(
                        count: 1,
                        productTitle: "포도씨유",
                        productUID: "productUID4",
                        productImage: "",
                        productPrice: 60000
                    ),
                    ReceiptItemModel(
                        count: 12,
                        productTitle: "곡물 버거번",
                        productUID: "productUID5",
                        productImage: "",
                        productPrice: 6000
                    ),
                    ReceiptItemModel(
                        count: 2,
                        productTitle: "두부 퀘사디아",
                        productUID: "productUID5",
                        productImage: "",
                        productPrice: 12000
                    )
                ]
            )
        ]
    }
}
