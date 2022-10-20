//
//  ContentView.swift
//  ReSwiftUIDemo
//
//  Created by 허두영 on 2022/10/20.
//

import SwiftUI

struct ContentView: View {
    var colors: [Color] = [.black, .red, .green, .blue]
    var colorNames: [String] = ["black", "red", "green", "blue"]
    
    
    //state 프로퍼티는 초기값이 필요함
    @State private var rotation: Double = 10.0
    @State private var text: String = "Welcome to SwiftUI"
    @State private var colorIndex: Int = 0
    
    var body: some View {
        VStack {
            
            Spacer()
            Text(text)
                .font(.largeTitle)
                .fontWeight(.heavy)
            //한글은 웨이트 옵션이 잘 안될 경우가 있어서 확인 필요함
                .rotationEffect(.degrees(rotation))
                .animation(.easeInOut(duration: 5), value: rotation)
                .foregroundColor(colors[colorIndex])
            
            Spacer()
            Divider()
            
            Slider(value: $rotation, in: 0...360,step: 0.1 )
            
            TextField("Enter text here", text: $text)
                .textFieldStyle(.roundedBorder)
            
            Picker(selection: $colorIndex,label: Text("Color")) {
                ForEach(0 ..< colorNames.count, id: \.self) {
                    Text(colorNames[$0])
                        .foregroundColor(colors[$0])
                    
                }
            }
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
