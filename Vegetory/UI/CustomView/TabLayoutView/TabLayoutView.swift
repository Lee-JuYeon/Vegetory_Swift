//
//  TabLayoutView.swift
//  Vegetory
//
//  Created by 이주연 on 2021/10/03.
//

import SwiftUI


struct TabLayoutView<GetView : View>: View {
    @State
    private var selectedPage = 0
    
    private var getView : () -> GetView
    
    private let headerItems : [String]
    
    private let tabColour : Color
    init( headerItems : [String],
          @ViewBuilder content : @escaping () -> GetView,
          tabColour : Color ){
        self.getView = content
        self.headerItems = headerItems
        self.tabColour = tabColour
    }
    
    var body: some View {
        VStack {
            //ScrollableTabView
            ScrollView(.horizontal, showsIndicators: false, content: {
                ScrollViewReader { scrollReader in
                    ScrollableTabView(
                        activeIdx: $selectedPage,
                        dataSet: headerItems,
                        getColour: tabColour
                    )
                    .padding(.top)
                    .onChange(of: selectedPage, perform: { value in
                        withAnimation{
                            scrollReader.scrollTo(value, anchor: .center)
                        }
                    })
                }
            })
            
            //Page View
            LazyHStack {
                TabView(selection: $selectedPage, content: getView)
                .frame(
                    width: UIScreen.main.bounds.width)
                //give padding nav height + scrollable Tab
                .tabViewStyle(PageTabViewStyle.init(indexDisplayMode: .never))
            }
        }
    }
}
