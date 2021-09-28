//
//  RefrigeratorContainerview.swift
//  Vegetory
//
//  Created by 이주연 on 2021/09/28.
//

import SwiftUI

struct RefrigeratorContainerview: View {
    let getWidth : CGFloat
    let getHeight : CGFloat
    var body: some View {
        GridView(
            setDivide: 2,
            setGridType: GridType.VERTICAL,
            setItemtype: .flexible(minimum: 20),
            setSpacing: 5,
            setContent: {
                ForEach(RefrigeratorBucketModel.RefrigeratorBucketList()){ model in
                    RefrigeratorBucketView(
                        setModel: model,
                        setWidth: getWidth / 2,
                        setHeight: getHeight / 6
                    )
                }
            }
        )
        .frame(
            minWidth: getWidth,
            idealWidth: getWidth,
            maxWidth: getWidth,
            minHeight: 0,
            idealHeight: getHeight,
            maxHeight: .infinity,
            alignment: .center
        )
        .modifier(RefrigeratorBackDoorDesgin())
    }
}

