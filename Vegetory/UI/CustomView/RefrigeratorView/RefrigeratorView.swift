//
//  RefrigeratorView.swift
//  Vegetory
//
//  Created by 이주연 on 2021/09/18.
//

import SwiftUI

struct RefrigeratorView : View {
    
    @State var degree : Double = 0

    @State var rightMove : CGFloat = 1
    @State var leftMove : CGFloat = -1
    
    private let getWidth : CGFloat
    private let getHeight : CGFloat
    @State private var getSide : CGFloat

    init(
        setWidth : CGFloat,
        setHeight : CGFloat,
        setSide : CGFloat
    ) {
        self.getWidth = setWidth
        self.getHeight = setHeight
        self.getSide = setSide
    }
    
        
    var body: some View {
        ZStack{
            RefrigeratorContainerview(getWidth: getWidth, getHeight: getHeight)
            
            RefrigeratorDoorView(
                setWidth: getWidth / 2,
                setHeight: getHeight,
                setSide: getSide,
                setLeftBackView : {
                    LeftDoorBack(getWidth: getWidth, getHeight: getHeight)
                },
                setLeftFrontView : {
                    LeftDoorFront(getWidth: getWidth, getHeight: getHeight)
                },
                setRightBackView : {
                    RightDoorBack(getWidth: getWidth, getHeight: getHeight)
                },
                setRightFrontView : {
                    RightDoorFront(getWidth: getWidth, getHeight: getHeight)
                }
            )
        }
        .frame(
            minWidth: 0,
            idealWidth: .infinity,
            maxWidth: .infinity,
            minHeight: 0,
            idealHeight: getHeight,
            maxHeight: getHeight,
            alignment: .center
        )
        .padding(.vertical, 10)
    }
}


/*
 Rectangle()
     .stroke(
         LinearGradient(
             gradient: Gradient(
                 colors: [
                     Color("DoorLight"),
                     Color("DoorDark")
                 ]),
             startPoint: .top,
             endPoint: .bottom
         )
     )
 
 VStack {
   Text("Run")
     .onTapGesture {
       withAnimation(.linear(duration: 16)) {
         self.blueDegree = 270
         self.blueOffset = 0
         
         self.redDegree = 180
         self.redOffset = 90
         
         self.greenDegree = 0
         self.greenOffset = 0
         
         self.orangeDegree = 90
         self.orangeOffset = -90
       }
   }
   ZStack {
     Spacer()
     ZStack {
       Text("6")
         .offset(.init(width: 24, height: 0))
       Rectangle()
         .stroke(Color.blue, lineWidth: 5)
         .opacity(0.2)
         .frame(width: setWidth, height: setHeight, alignment: .center)
     }
     .rotation3DEffect(
         .degrees(self.blueDegree),
         axis: (x: 0, y: -1, z: 0),
         anchor: UnitPoint.trailing,
         anchorZ: 0,
         perspective: -0.1
     )
     .offset(CGSize(width: blueOffset, height: 0))
     
     ZStack {
       Text("2")
         .offset(.init(width: -24, height: 0))
       Rectangle()
         .stroke(Color.red, lineWidth: 5)
         .opacity(0.2)
         .frame(width: 90, height: 90, alignment: .center)
     }.rotation3DEffect(.degrees(self.redDegree), axis: (x: 0, y: -1, z: 0), anchor: UnitPoint.leading, anchorZ: 0, perspective: -0.1)
     .offset(CGSize(width: redOffset, height: 0))
     Spacer()

     Spacer()
     ZStack {
       Text("5")
         .onTapGesture {
           print("greenDegree ",self.greenDegree)
           print("greenOffset ",self.greenOffset)
         }
         .offset(.init(width: 0, height: 24))
       Rectangle()
         .stroke(Color.green, lineWidth: 5)
         .opacity(0.9)
         .frame(width: 90, height: 90, alignment: .center)
     }.rotation3DEffect(.degrees(greenDegree), axis: (x: 0, y: 1, z: 0), anchor: UnitPoint.leading, anchorZ: 0, perspective: 0.1)
     .offset(CGSize(width: greenOffset, height: 0))
     ZStack {
       Text("1")
         .offset(.init(width: 0, height: -24))
       Rectangle()
         .stroke(Color.orange, lineWidth: 5)
         .opacity(0.9)
         .frame(width: 90, height: 90, alignment: .center)
     }.rotation3DEffect(.degrees(self.orangeDegree), axis: (x: 0, y: -1, z: 0), anchor: UnitPoint.trailing, anchorZ: 0, perspective: 0.1)
     .offset(x: orangeOffset, y: 0)
     
     Spacer()
   }
 }

 */
