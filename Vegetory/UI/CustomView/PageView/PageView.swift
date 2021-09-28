//
//  FrameView.swift
//  Vegetory
//
//  Created by 이주연 on 2021/09/26.
//

import SwiftUI

struct PageView<GetView : View, BACKGROUND : View>: View {
    
    @Environment(\.scenePhase) private var scenePhase
    
    private var getHeight : CGFloat
    private var getWidth  : CGFloat
    private var getContent : GetView
    private var getBackground : BACKGROUND
    private var getPageCount : Int
    @Binding var getCurrrentIndex : Int

    init(
        setWidth : CGFloat,
        setHeight : CGFloat,
        setPageCount : Int,
        setCurrentIndex : Binding<Int>,
        @ViewBuilder setBackground : @escaping () -> BACKGROUND,
        @ViewBuilder setContent : @escaping () -> GetView
    ) {
        self.getWidth = setWidth
        self.getHeight = setHeight
        self._getCurrrentIndex = setCurrentIndex
        self.getPageCount = setPageCount
        self.getBackground = setBackground()
        self.getContent = setContent()
    }

    @GestureState private var translation : CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
                HStack(spacing: 0) {
                    getContent
                }
                .offset( x: -CGFloat(self.getCurrrentIndex) * geometry.size.width)
                .offset(x: self.translation)
                .gesture(
                    DragGesture()
                        .updating(self.$translation) { value, state, _ in
                                   state = value.translation.width
                            
                        }.onEnded { value in
                            let offset = value.translation.width / geometry.size.width
                            let newIndex = (CGFloat(self.getCurrrentIndex) - offset).rounded()
                            self.getCurrrentIndex = min(max(Int(newIndex), 0), self.getPageCount - 1)
                        }
                )
        }
        .frame(
            width: getWidth,
            height: getHeight
        )
        .background(getBackground)
        .onAppear {
            print("viewDidAppear 뷰가 보였을때")
        }
        .onDisappear {
            print("viewDidDisappear 뷰가 사라졌을 때")
        }
        .onChange(of: scenePhase) { (phase) in
            switch phase{
            case .active:
                print("active")
            case .background:
                print("background")
            case .inactive:
                print("inactive")
            default:
                print("default")
            }
        }
        .onOpenURL { url in
            print("특정 url로 이동시 상태변화")
            print("url : \(url)")
        }
    }
}
