//
//  RefrigeratorDoorView.swift
//  Vegetory
//
//  Created by 이주연 on 2021/09/21.
//

import SwiftUI

struct RefrigeratorDoorView : View {
    @State var degree : Double = 0

    @State var rightMove : CGFloat = 1
    @State var leftMove : CGFloat = -1
    
    private let getWidth : CGFloat
    private let getHeight : CGFloat
    private let getDoorImage : String
    private let getDoorType : DoorType
    @State private var getSide : CGFloat

    init(
        setWidth : CGFloat,
        setHeight : CGFloat,
        setSide : CGFloat,
        setDoorType : DoorType,
        setDoorImage : String
    ) {
        self.getWidth = setWidth
        self.getHeight = setHeight
        self.getSide = setSide
        self.getDoorType = setDoorType
        self.getDoorImage = setDoorImage
    }
    
    private func getDoorType(type : DoorType) -> UnitPoint{
        switch type {
        case DoorType.LEFT :
             return  UnitPoint.leading
        case DoorType.RIGHT :
             return UnitPoint.trailing
        }
    }
    
    private func setDragGesture(value : CGPoint) {
        /* drag가 진행중
        predictedEndTranslation은 반올림하여 0.5, 0로 소숫점 1째자리를 마루리하지만,
        translation은 실제 값을 리턴한다.
         
        1도당 3.6DP로 설정한다. ( 더 넓게 쓰려면 반값인 1.8로.
        */
        let valueToCGFloat = Double(value.x * 3)
        
        switch getDoorType {
        case .LEFT:
            if (valueToCGFloat > -180 && valueToCGFloat < 1 ) {
                print("local : \(valueToCGFloat)")
                self.degree = valueToCGFloat
            }
        case .RIGHT:
            if (valueToCGFloat > -180 && valueToCGFloat < 1 ) {
                print("local : \(valueToCGFloat)")
                self.degree = valueToCGFloat
            }
        }
    }
    
    private func setDistance(value : CGPoint){
        /* drag가 진행중
        predictedEndTranslation은 반올림하여 0.5, 0로 소숫점 1째자리를 마루리하지만,
        translation은 실제 값을 리턴한다.
         
        1도당 3.6DP로 설정한다. ( 더 넓게 쓰려면 반값인 1.8로.
        1도에 4.5dp씩 이동
        */
        let valueToFloat = Double(value.x * 3)
        let degree = valueToFloat * 4.5

        if degree < -180 {


        }else{
            self.degree = degree
            print("Degree : \(self.degree)")
        }
    }
    
    private func whenTap(){
        withAnimation(.linear(duration: 16)){
            self.degree = 1
        }
    }
          
    var body: some View {
        ZStack{
            Spacer()
            ZStack{
                Rectangle()
                    .fill(Color.red)
                    .frame(
                        width: getWidth,
                        height: getHeight,
                        alignment: .center
                    )
                    // width는 x축으로 n만큼 이동, height는 y축으로 n만큼 이동, CGSize로 사용.
                    .offset(.init(width: 24, height: 0))
            }
            .rotation3DEffect(
                .degrees(self.degree), // 몇도를 회전된 상태를 보여줄거냐
                axis: (x: 0, y:self.leftMove, z: 0), // -y, -x축으로 회전시킬것이다.
                anchor: getDoorType(type: getDoorType),
                anchorZ:0,
                perspective: -0.1 // 원근법
            )
            .offset(x: 0, y: 0)
            Spacer()
            
            Spacer()
            ZStack{
                Image(getDoorImage)
                    .resizable()
                    .frame(
                        width: getWidth,
                        height: getHeight,
                        alignment: .center
                    )
                    // width는 x축으로 n만큼 이동, height는 y축으로 n만큼 이동, CGSize로 사용.
                    .offset(.init(width: 0, height: 0))
            }
            .brightness(-0.05) // 명암조절
            .rotation3DEffect(
                .degrees(self.degree), // 몇도를 회전된 상태를 보여줄거냐
                axis: (x: 0, y:self.leftMove, z: 0), // -y, -x축으로 회전시킬것이다.
                anchor: getDoorType(type: getDoorType),
                anchorZ:0,
                perspective: -0.1 // 원근법
            )
            .offset(
                x: getSide, y: 0
            )
            Spacer()
            
        }
        .gesture(
            DragGesture()
                .onChanged({ value in
                    setDragGesture(value: value.location)
                    setDistance(value: value.location)
                })
                .onEnded({ value in
                    /* drag가 끝났을 때
                    */
                    print("onEnded : \(value.translation)")
                })
        )
    }
}
