//
//  CubeExample.swift
//  Vegetory
//
//  Created by 이주연 on 2021/09/22.
//

import SwiftUI

struct HStackCube : View {
    var setWidth : CGFloat
    var setHeight : CGFloat
    
    @State var degree : Double = 0
    var body: some View {
        ZStack{
            HStack(
                alignment: VerticalAlignment.center,
                spacing: 0
            ){
                Rectangle()
                    .stroke(Color.red, lineWidth: 3)
                    .frame(
                        width: setWidth,
                        height: setHeight,
                        alignment: .center
                    )
                    .rotation3DEffect(
                        .degrees(0),
                        axis: (x: 0, y:1, z: 0),
                        anchor: UnitPoint.leading,
                        anchorZ: 0,
                        perspective: -0.1
                    )
                Rectangle()
                    .stroke(Color.green, lineWidth: 3)
                    .frame(
                        width: setWidth,
                        height: setHeight,
                        alignment: .center
                    )
                    .rotation3DEffect(
                        .degrees(-90),
                        axis: (x: 0, y:1, z: 0),
                        anchor: UnitPoint.leading,
                        anchorZ: 0,
                        perspective: -0.1
                    )
                Rectangle()
                    .stroke(Color.yellow, lineWidth: 3)
                    .frame(
                        width: setWidth,
                        height: setHeight,
                        alignment: .center
                    )
                    .rotation3DEffect(
                        .degrees(180),
                        axis: (x: 0, y:1, z: 0),
                        anchor: UnitPoint.leading,
                        anchorZ: 0,
                        perspective: -0.1
                    )
                Rectangle()
                    .stroke(Color.blue, lineWidth: 3)
                    .frame(
                        width: setWidth,
                        height: setHeight,
                        alignment: .center
                    )
                    .rotation3DEffect(
                        .degrees(90),
                        axis: (x: 0, y:1, z: 0),
                        anchor: UnitPoint.leading,
                        anchorZ: 0,
                        perspective: -0.1
                    )
                
            }
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .leading
            )
            .rotation3DEffect(
                .degrees(self.degree),
                axis: (x: 0, y: 1, z: 0),
                anchor: UnitPoint.center,
                anchorZ: 0,
                perspective: 0
            )
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        print("onWork : \(value.translation)")
                        self.degree = Double(value.translation.width) * 3
                    })
                    .onEnded({ value in
                        /* drag가 끝났을 때
                        */
                        print("onEnded : \(value.translation)")
                    })
            )
        }
        .frame(
            minWidth: 0,
            idealWidth: setWidth * 4,
            maxWidth: .infinity,
            minHeight: 0,
            idealHeight: setHeight,
            maxHeight: .infinity,
            alignment: .leading
        )
       
    }
}

struct CubeExample: View {
  
    @State var backOffset:CGFloat = -90
    @State var backDegree:Double = 180
    
    @State var leftOffset: CGFloat = 0
    @State var leftDegree:Double = 90
    
    @State var rightOffset:CGFloat = 90
    @State var rightDegree:Double = 90
    
    @State var frontDegree: Double = 0
    @State var frontOffset: CGFloat = 0
    
    var body: some View {
      VStack {
        Text("Run")
          .onTapGesture {
            withAnimation(.linear(duration: 16)) {
              self.backDegree = 270
              self.backOffset = 0
              
              self.leftDegree = 180
              self.leftOffset = 90
              
              self.rightDegree = 0
              self.rightOffset = 0
              
              self.frontDegree = 90
              self.frontOffset = -90
            }
        }
        ZStack {
          Spacer()
          ZStack {
            Text("back")
              .offset(.init(width: 24, height: 0))
            Rectangle()
              .stroke(Color.blue, lineWidth: 5)
              .opacity(0.2)
              .frame(width: 90, height: 90, alignment: .center)
          }
          .rotation3DEffect(
            .degrees(self.backDegree),
            axis: (x: 0, y: -1, z: 0),
            anchor: UnitPoint.trailing,
            anchorZ: 0,
            perspective: -0.1
          )
            .offset(CGSize(width: backOffset, height: 0))
            
          ZStack {
            Text("left")
              .offset(.init(width: -24, height: 0))
            Rectangle()
              .stroke(Color.red, lineWidth: 5)
              .opacity(0.2)
              .frame(width: 90, height: 90, alignment: .center)
          }.rotation3DEffect(.degrees(self.leftDegree), axis: (x: 0, y: -1, z: 0), anchor: UnitPoint.leading, anchorZ: 0, perspective: -0.1)
          .offset(CGSize(width: leftOffset, height: 0))
          Spacer()

          Spacer()
          ZStack {
            Text("right")
              .onTapGesture {
                print("greenDegree ",self.rightDegree)
                print("greenOffset ",self.rightOffset)
              }
              .offset(.init(width: 0, height: 24))
            Rectangle()
              .stroke(Color.green, lineWidth: 5)
              .opacity(0.9)
              .frame(width: 90, height: 90, alignment: .center)
          }
          .rotation3DEffect(
            .degrees(rightDegree),
            axis: (x: 0, y: 1, z: 0),
            anchor: UnitPoint.leading,
            anchorZ: 0,
            perspective: 0.1)
          .offset(
            CGSize(width: rightOffset, height: 0))
            
          ZStack {
            Text("front")
              .offset(.init(width: 0, height: -24))
            Rectangle()
              .stroke(Color.orange, lineWidth: 5)
              .opacity(0.9)
              .frame(width: 90, height: 90, alignment: .center)
          }.rotation3DEffect(.degrees(self.frontDegree), axis: (x: 0, y: -1, z: 0), anchor: UnitPoint.trailing, anchorZ: 0, perspective: 0.1)
          .offset(x: frontOffset, y: 0)
          
          Spacer()
        }
      }
    
    }
}
