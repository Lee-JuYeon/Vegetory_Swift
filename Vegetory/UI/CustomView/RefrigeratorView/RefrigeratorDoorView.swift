//
//  RefrigeratorDoorView.swift
//  Vegetory
//
//  Created by 이주연 on 2021/09/21.
//

import SwiftUI

struct RefrigeratorDoorView : View {
    @State var degree : Double = 0
    
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
        self.getSide = 0
        self.getDoorType = setDoorType
        self.getDoorImage = setDoorImage
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
            }
            .rotation3DEffect(
                .degrees(self.degree), // 몇도를 회전된 상태를 보여줄거냐
                axis: (x: 0, y:CGFloat(self.getDoorType.rawValue), z: 0), // -y, -x축으로 회전시킬것이다.
                anchor: getDoorType(type: getDoorType),
                anchorZ:0,
                perspective: -0.1 // 원근법
            )
            // width는 x축으로 n만큼 이동, height는 y축으로 n만큼 이동, CGSize로 사용.
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
            }
            .brightness(-0.05) // 명암조절
            .rotation3DEffect(
                .degrees(self.degree), // 몇도를 회전된 상태를 보여줄거냐
                axis: (x: 0, y:CGFloat(self.getDoorType.rawValue), z: 0), // -y, -x축으로 회전시킬것이다.
                anchor: getDoorType(type: getDoorType),
                anchorZ:0,
                perspective: -0.1 // 원근법
            )
            // width는 x축으로 n만큼 이동, height는 y축으로 n만큼 이동, CGSize로 사용.
            .offset(
                x: getSide, y: 0
            )
            
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
//                print("left : \(valueToCGFloat)")
                self.degree = valueToCGFloat
            }
        case .RIGHT:
            if (valueToCGFloat > -180 && valueToCGFloat < 1 ) {
//                print("right : \(valueToCGFloat)")
                self.degree = valueToCGFloat
            }
        }
    }
    
    private func setDistance(value : CGPoint){
        /* drag가 진행중
        predictedEndTranslation은 반올림하여 0.5, 0로 소숫점 1째자리를 마루리하지만,
        translation은 실제 값을 리턴한다.
         
        1도당 3.6DP로 설정한다. ( 더 넓게 쓰려면 반값인 1.8로.
        1도에 4.5dp씩 이동 (기준을 20dp로 잡았기 때문. 90도 / 20dp)
         
        여기는 offset을 관장하고 있는 부분이다.
        냉장고 앞면을 0 ~ -90도까지는 0 -> 20까지 증가시켜야하지만,
        -90 ~ -180도까지는 20에서 0으로 다시 역행하는 int값을 가져야한다.
        그 이유는, 정육면체의 앞면은 0에서 90도까지는 0 -> 20dp만큼 점진적으로 늘어나는 값을 가지지만,
        90도부터 180도까지는 그 반대인 20dp에서 0dp로 축소되는 애니메이션을 가지고 있다.
        정육면체를 가지고 한번 0 -> 90, 90 -> 180도로 천천히 돌려보면 무슨 말인지 알 듯 싶다.
        */
        let valueToFloat = Double(value.x * 3)
        let baseDegree = valueToFloat / -4.5

        if valueToFloat > -90 && valueToFloat < 0 {
            let convertedDegree = CGFloat(baseDegree)
            self.getSide = convertedDegree
            print("90 : \(convertedDegree)")
        }else if (valueToFloat > -180 && valueToFloat < -90) {
            /*
             1, (baseDegree-20)에서 20을 빼주지 않으면 31, 32, 33, ....50까지 간다.
             즉, 50dp까지 가게 되는 것이다. 고로 0-20dp를 유지시키기 위해 -20을 해주었다.
             2, (baseDegree-20) - 20에서 왜 20을 더 빼주었냐면, int의 역행을 위해서인데,
             기존 값에서 20을 뺴면 몫이 20부터 0까지 역행하기 때문에 역행하는 애니메이션에 적합하다.
             */
            let convertedDegree = CGFloat((baseDegree - 20) - 20)
            self.getSide = convertedDegree
            print("180 : \(convertedDegree)")
        }
    }
    
}

/*
 #151718 문 옆 색깔 프레임
 */
