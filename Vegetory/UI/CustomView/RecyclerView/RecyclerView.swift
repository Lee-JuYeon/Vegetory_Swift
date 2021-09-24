//
//  RecyclerView.swift
//  Vegetory
//
//  Created by 이주연 on 2021/09/25.
//

import SwiftUI

enum RecyclerViewAxis {
    case HORIZONTAL, VERTICAL
}

struct RecyclerView<GetViewHolder : View>: View {
    
    private var getAxis : RecyclerViewAxis
    private var getShowBar : Bool
    private var getSpacing : CGFloat
    private var getHorizontalAlignment : HorizontalAlignment
    private var getVerticalAlignment : VerticalAlignment
    @ViewBuilder private var getContent : GetViewHolder
    
    init(
        setAxis : RecyclerViewAxis,
        setShowBar : Bool,
        setSpacing : CGFloat,
        setHorizontalAlignment : HorizontalAlignment? = HorizontalAlignment.center,
        setVerticalAlignment : VerticalAlignment? = VerticalAlignment.center,
        setContent : @escaping () -> GetViewHolder
    ) {
        self.getContent = setContent()
        self.getAxis = setAxis
        self.getShowBar = setShowBar
        self.getSpacing = setSpacing
        self.getHorizontalAlignment = setHorizontalAlignment ?? HorizontalAlignment.center
        self.getVerticalAlignment = setVerticalAlignment ?? VerticalAlignment.center
    }
    
    var body: some View {
        ScrollView(showsIndicators : getShowBar){
            switch getAxis {
            case .VERTICAL :
                LazyVStack(
                    alignment: getHorizontalAlignment, spacing: getSpacing
                ){
                    getContent
                }
            case .HORIZONTAL :
                LazyHStack(
                    alignment: getVerticalAlignment, spacing: getSpacing
                ){
                    getContent
                }
            }
        }
    }
}
