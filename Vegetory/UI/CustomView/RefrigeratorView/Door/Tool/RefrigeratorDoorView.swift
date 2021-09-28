//
//  RefrigeratorDoorView.swift
//  Vegetory
//
//  Created by 이주연 on 2021/09/21.
//

import SwiftUI

struct RefrigeratorDoorView<
    LeftBackView : View,
    LeftFrontView : View,
    RightBackView : View,
    RightFrontView : View
> : View {
    
    private let getWidth : CGFloat
    private let getHeight : CGFloat
    private var getLeftBackView : LeftBackView
    private var getLeftFrontView : LeftFrontView
    private var getRightBackView : RightBackView
    private var getRightFrontView : RightFrontView
    private var getSide : CGFloat

    init(
        setWidth : CGFloat,
        setHeight : CGFloat,
        setSide : CGFloat,
        @ViewBuilder setLeftBackView : @escaping () -> LeftBackView,
        @ViewBuilder setLeftFrontView : @escaping () -> LeftFrontView,
        @ViewBuilder setRightBackView : @escaping () -> RightBackView,
        @ViewBuilder setRightFrontView : @escaping () -> RightFrontView
    ) {
        self.getWidth = setWidth
        self.getHeight = setHeight
        self.getSide = setSide
        self.getLeftBackView = setLeftBackView()
        self.getLeftFrontView = setLeftFrontView()
        self.getRightBackView = setRightBackView()
        self.getRightFrontView = setRightFrontView()
        
        sideOffSet = setWidth/2
        print("sideOffset : \(sideOffSet)")
    }
    
    
    @State var degree : Double = 0
    @State var sideDegree : Double = 90
    @State var sideOffSet : CGFloat = 0
    @State var frontOffSet : CGFloat = 0
    @State var frontZIndex : Double = 1
    @State var backZIndex : Double = 0
    
    
    private let setPerspective : CGFloat = -0.1
          
    var body: some View {
        HStack(
            alignment : VerticalAlignment.center,
            spacing: 0
        ){
            ZStack{
                //뒷면
                getLeftBackView
                    .frame(
                        width: getWidth,
                        height: getHeight
                    )
                    .scaleEffect( // 좌우반전
                        x: -1,
                        y: 1,
                        anchor: .center
                    )
                    .rotation3DEffect(
                        .degrees(-self.degree),
                        axis: (
                            x: 0,
                            y: 1,
                            z: 0
                        ),
                        anchor: UnitPoint.leading,
                        anchorZ: 0,
                        perspective: setPerspective
                    )
                    .zIndex(self.backZIndex)

                // 사이드
                Rectangle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(
                                colors: [
                                    Color("HandleTop"),
                                    Color("HandleMiddle"),
                                    Color("HandleBottom")
                                ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(
                        width: getSide,
                        height: getHeight
                    )
                    .rotation3DEffect(
                        .degrees(self.sideDegree),
                        axis: (
                            x: 0,
                            y: 1,
                            z: 0
                        ),
                        anchor: UnitPoint.leading,
                        anchorZ: 0,
                        perspective: 0
                    )
                    .offset(x: self.sideOffSet, y: 0)
                    .zIndex(2)
                
                //앞면
                getLeftFrontView
                    .frame(
                        width: getWidth,
                        height: getHeight
                    )
                    .rotation3DEffect(
                        .degrees(-self.degree),
                        axis: (
                            x: 0,
                            y: 1,
                            z: 0
                        ),
                        anchor: UnitPoint.leading,
                        anchorZ: 0,
                        perspective: setPerspective
                    )
                    .offset(x: self.frontOffSet, y: 0)
                    .zIndex(self.frontZIndex)
                
            }
           
            ZStack{
                //뒷면
                getRightBackView
                    .frame(
                        width: getWidth,
                        height: getHeight
                    )
                    .scaleEffect( // 좌우반전
                        x: -1,
                        y: 1,
                        anchor: .center
                    )
                    .rotation3DEffect(
                        .degrees(self.degree),
                        axis: (
                            x: 0,
                            y: 1,
                            z: 0
                        ),
                        anchor: UnitPoint.trailing,
                        anchorZ: 0,
                        perspective: setPerspective
                    )
                    .zIndex(self.backZIndex)

                
                // 사이드
                Rectangle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(
                                colors: [
                                    Color("HandleTop"),
                                    Color("HandleMiddle"),
                                    Color("HandleBottom")
                                ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(
                        width: getSide,
                        height: getHeight
                    )
                    .rotation3DEffect(
                        .degrees(-self.sideDegree),
                        axis: (
                            x: 0,
                            y: 1,
                            z: 0
                        ),
                        anchor: UnitPoint.trailing,
                        anchorZ: 0,
                        perspective: 0
                    )
                    .offset(x: -self.sideOffSet, y: 0)
                    .zIndex(2)
                
                //앞면
                getRightFrontView
                    .frame(
                        width: getWidth,
                        height: getHeight
                    )
                    .rotation3DEffect(
                        .degrees(self.degree),
                        axis: (
                            x: 0,
                            y: 1,
                            z: 0
                        ),
                        anchor: UnitPoint.trailing,
                        anchorZ: 0,
                        perspective: setPerspective
                    )
                    .offset(x: -self.frontOffSet, y: 0)
                    .zIndex(self.frontZIndex)
            }
        }
        .gesture(
            DragGesture()
                .onChanged({ value in
                    let degree = Double(value.translation.width)
                    let degreeSpeedUp_x3 = degree * 3
                    setBackDegree(get: degreeSpeedUp_x3)
                    setSideDegree(get: degreeSpeedUp_x3)
                    setSideOffset(get: CGFloat(degreeSpeedUp_x3))
                    setFrontOffset(get : CGFloat(degreeSpeedUp_x3))
                    changeZIndex(get: CGFloat(degreeSpeedUp_x3))
                })
                .onEnded({ value in
                    /* drag가 끝났을 때
                    */
                    print("onEnded : \(value.translation)")
                })
        )
    }
    
    private func setBackDegree(get : Double){
        if get > -180.5 && get < -0.5 {
            self.degree = get
        }
    }
    
    private func setSideDegree(get : Double){
        if get > -90 && get < -0.5 {
            self.sideDegree = get + 90
        }else if get > -180.5 && get < -90.5 {
            self.sideDegree = get - 270
        }
    }
    
    private func setSideOffset(get : CGFloat){
        if get > -90 && get < -0.5 {
            self.sideOffSet = CGFloat(tan(Double(get) * M_PI / 180))
            print("get + 90 : \(self.sideOffSet)")
        }else if get > -180.5 && get < -90.5 {
            print("get - 90 : \(self.sideDegree)")
        }
    }
  
    private func setFrontOffset(get : CGFloat){
        if get > -90 && get < -0.5 {
            let getDegree = get / 4.5
            self.frontOffSet = getDegree
        }else if get > -180.5 && get < -90.5 {
            let getDegree = get / -4.5
            let setOffsetInRightWay = CGFloat((getDegree - getSide) - getSide)
            self.frontOffSet = setOffsetInRightWay
        }
    }
    
    private func changeZIndex(get : CGFloat){
        if get > -90 && get < -0.5 {
            self.frontZIndex = 1
            self.backZIndex = 0
        }else if get > -180.5 && get < -90.5 {
            self.frontZIndex = 0
            self.backZIndex = 1
        }
    }
}

/*
 #151718 문 옆 색깔 프레임
 
 ZStack{
     // BACK SIDE
     ZStack{
         Text("뒷면(Behind View)")
             .background(Color.white)
             .frame(
                 width: getWidth,
                 height: getHeight,
                 alignment: .center
             )
             .rotation3DEffect(
                 .degrees(360),
                 axis: (x: 0, y:0, z: 0),
                 anchor: UnitPoint.center,
                 anchorZ:0,
                 perspective: 0
             )
         Rectangle()
             .stroke(Color("SideFrameColour"), lineWidth : 3)
             .frame(
                 width: getWidth,
                 height: getHeight,
                 alignment: .center
             )
     }
     .zIndex(self.backZIndex)
     .rotation3DEffect(
         .degrees(self.degree), // 몇도를 회전된 상태를 보여줄거냐
         axis: (x: 0, y:CGFloat(self.getDoorType.rawValue), z: 0), // -y, -x축으로 회전시킬것이다.
//                anchor: getDoorType(type: getDoorType),
         anchor: getDoorType(type: getDoorType),
         anchorZ:0,
         perspective: setPerspective // 원근법
     )
     // width는 x축으로 n만큼 이동, height는 y축으로 n만큼 이동, CGSize로 사용.
     .offset(
         CGSize(width: 0,
                height: 0)
     )
     
     // Right SIDE
     Rectangle()
         .fill(Color("SideFrameColour"))
         .frame(
             width: 20,
             height: getHeight,
             alignment: .center
         )
         .zIndex(2)
         .rotation3DEffect(
             .degrees(self.rightDegree),
             axis: (x: 0, y: 1, z: 0),
             anchor: UnitPoint.leading,
             anchorZ: 0,
             perspective: 0
         )
         .offset(
             CGSize(
                 width: rightOffset,
                 height: 0
             )
         )
     
     // FRONT SIDE
     Image(getDoorImage)
         .resizable()
         .frame(
             width: getWidth,
             height: getHeight,
             alignment: .center
         )
         .zIndex(self.frontZIndex)
         .brightness(-0.05) // 명암조절
         .rotation3DEffect(
             .degrees(self.degree), // 몇도를 회전된 상태를 보여줄거냐
             axis: (x: 0, y:CGFloat(self.getDoorType.rawValue), z: 0), // -y, -x축으로 회전시킬것이다.
//                anchor: getDoorType(type: getDoorType),
             anchor: getDoorType(type: getDoorType),
             anchorZ:0,
             perspective: setPerspective // 원근법
         )
         // width는 x축으로 n만큼 이동, height는 y축으로 n만큼 이동, CGSize로 사용.
         .offset(
             x: getSide, y: 0
         )
     Spacer()
 
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
     let valueToDegree = Double(value.x * 3)
     
     switch getDoorType {
     case .LEFT:
         if (valueToDegree > -180 && valueToDegree < 1 ) {
             self.degree = valueToDegree
             self.leftDegree = -(valueToDegree)
//                print("left : \(self.leftDegree)")
             self.rightOffset = CGFloat(valueToDegree)
             print("left : \(self.rightOffset)")
         }
     case .RIGHT:
         if (valueToDegree > -180 && valueToDegree < 1 ) {
//                print("right : \(valueToCGFloat)")
             self.degree = valueToDegree
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

     if valueToFloat > -90 && valueToFloat < 0 {
         let baseDegree = valueToFloat / 4.5
         let convertedDegree = CGFloat(baseDegree)
         self.getSide = convertedDegree
         self.frontZIndex = 1
         self.backZIndex = 0
         self.rightDegree = valueToFloat + 90
     }else if (valueToFloat > -180 && valueToFloat < -90) {
         /*
          1, (baseDegree-20)에서 20을 빼주지 않으면 31, 32, 33, ....50까지 간다.
          즉, 50dp까지 가게 되는 것이다. 고로 0-20dp를 유지시키기 위해 -20을 해주었다.
          
          2, (baseDegree-20) - 20에서 왜 20을 더 빼주었냐면, int의 역행을 위해서인데,
          기존 값에서 20을 뺴면 몫이 20부터 0까지 역행하기 때문에 역행하는 애니메이션에 적합하다.
          
          3. 위와 달리 baseDegree가 +4.5가 아닌,  -4.5로 나뉜다
          이에 대한 이유는, frontView가 offset +x방향이 아닌, -x방향으로 이동해야하기 때문이다.
          (추가적으로 왼쪽으로 회전할 경우 0 -> -90로 이동하기 때문에 -4.5로 나누면 offSet x의 이동방향이 정해지기 떄문)
          
          */
         let baseDegree = valueToFloat / -4.5
         let convertedDegree = CGFloat((baseDegree - 20) - 20)
         self.getSide = convertedDegree
         self.frontZIndex = 0
         self.backZIndex = 1
         self.rightDegree = valueToFloat - 90
//            print("180 : \(convertedDegree)")
     }
 }
     
 }
 */
