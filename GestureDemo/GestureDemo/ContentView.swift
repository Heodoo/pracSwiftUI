//
//  ContentView.swift
//  GestureDemo
//
//  Created by 허두영 on 2022/11/01.
//

import SwiftUI

struct ContentView: View {
    @State private var magnification: CGFloat = 1.0
    
    //tap을 바디밖으로 쓰는건 조심할 필요가 있음
    //body 안에서 선언하고 return VStack {...} 이 방법을 더 추천
    let tap = TapGesture().onEnded { _ in
        print("Tapped 2")
    }
    //2번 빠르게 탭하는 제스처
    //하지만 이런 제스처를 설명없이 사용자가 찾기는 어려움
    let tap2 = TapGesture(count: 2).onEnded { _ in
        print("Tapped 3")
    }
    
    @GestureState private var offset : CGSize = .zero
    @GestureState private var offset2 : CGSize = .zero
    @GestureState private var longPress: Bool = false
    
    var body: some View {
        //핀치줌인아웃 제스처, 시뮬레이터에서 옵션누르고 마우스
        let magnificationGesture = MagnificationGesture(minimumScaleDelta: 0)
            .onChanged { value in
                magnification = value
            }
            .onEnded { value in
                print("value: \(value)")
            }
        
        let drag = DragGesture()
        //updata와 @GestureState 는 세트
            .updating($offset, body: { dragValue, state, transaction in
                state = dragValue.translation
                print("updating")
            })
            .onEnded { _ in
                print("drag ended")
            }
        let longPressAndDrag = LongPressGesture(minimumDuration: 1.0)
            .updating($longPress) { value, state, transaction in
                state = value
            }
            .simultaneously(with: DragGesture())
            .updating($offset2) { value, state, transaction in
                state = value.second?.translation ?? .zero
            }
        
        
        
        return VStack {
            Spacer()
            Image(systemName: "globe")
                .gesture(TapGesture().onEnded({ _ in
                    print("Tapped 1")
                }))
            Spacer()
            Image(systemName: "globe")
                .gesture(tap)
            Spacer()
            Image(systemName: "hand.point.right.fill")
                .resizable()
                .scaleEffect(magnification)
                //.font(.largeTitle)
                .gesture(magnificationGesture)
                .frame(width:100, height: 90)
            // 애플에서 만든 CGPoint 단위임 , 픽셀단위가 아님
            Spacer()
            Image(systemName: "hand.point.right.fill")
                .resizable()
            //순서 중요
                .offset(offset)
                .gesture(drag)
                .frame(width:100, height: 90)
            Spacer()
            Image(systemName: "hand.point.right.fill")
                .resizable()
                .offset(offset2)
                .gesture(longPressAndDrag)
                .frame(width:100, height: 90)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
