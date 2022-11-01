//
//  ContentView.swift
//  AnimationDemo
//
//  Created by 허두영 on 2022/10/31.
//

import SwiftUI

struct ContentView: View {
    @State private var rotaion : Double = 0.0
    @State private var scale: CGFloat = 1.0
    var body: some View {
        VStack {
            Button(action:{
                // 여기서 바뀌는 내용을 뷰에서 다시 그리려면 스테이트 프로퍼티로 변수를 생성해야한다
                rotaion = (rotaion < 360) ? rotaion + 60 : 0
                
                scale = scale < 2.8 ? scale + 0.3  : 1
            }){
                Text("Click to animate")
                .rotationEffect(.degrees(rotaion))
                .scaleEffect(scale)
                .animation(.linear(duration: 1).repeatCount(10),value: scale)
                //.animation(.easeInOut(duration: 1), value: rotaion)
                
            }
            
        }
        .padding()
    }
}

struct ContentView2: View {
    @State private var visibility: Bool = false
    var body: some View {
        VStack {
            Toggle(isOn: $visibility.animation(.easeIn(duration: 3))) {
                Text("Toggle Text Views")
            }
            
            Text(visibility ? "Hello World" : "Goodbye World")
                .font(.largeTitle)
        }
        .padding()
    }
        
}

struct ContentView3: View {
    @State private var isButtonVisible: Bool = false
    var body: some View {
        VStack {
            Toggle(isOn: $isButtonVisible.animation(.easeIn(duration: 3))) {
                Text("Show/Hide Button")
            }
            
            if isButtonVisible{
                Button(action: {}) {
                    Text("Example Button")
                }
                .font(.largeTitle)
                .
            }
        }
        .padding()
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView3()
    }
}
