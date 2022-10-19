//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by 허두영 on 2022/10/19.
//

import SwiftUI


struct ContentView: View {
    
    var colors:[Color] = [.black,.red,.green, .blue]
    var colornames = ["Black","Red","Green","Blue"]
    
    @State private var colorIndex = 0
    @State private var rotation: Double = 0
    @State private var text: String = "Welcome to SwiftUI"

    let imageURL = "https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/%EB%A9%8B%EC%9F%81%EC%9D%B4%EC%82%AC%EC%9E%90%EC%B2%98%EB%9F%BC_%EB%A1%9C%EA%B3%A0.png/692px-%EB%A9%8B%EC%9F%81%EC%9D%B4%EC%82%AC%EC%9E%90%EC%B2%98%EB%9F%BC_%EB%A1%9C%EA%B3%A0.png"
    
    var body: some View {
        VStack {
            Spacer()
            Text("Hello, world!")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .rotationEffect(.degrees(self.rotation))
                .animation(.easeInOut(duration: 5))
                .foregroundColor(colors[colorIndex])
            Spacer()
            Divider()
            Slider(value: $rotation, in: 0...360, step: 0.1)
                .padding()
            
            TextField("Enter text here",text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            HStack{
                Text("Color")
                    .foregroundColor(colors[colorIndex])
                Picker(selection: $colorIndex, label: Text("Color")) {
                    ForEach (0..<colornames.count){
                        Text(colornames[$0])
                            .foregroundColor(colors[$0])
                            .tag(colors[$0])
                    }
                }.pickerStyle(.menu)

                AsyncImage(url: URL(string: imageURL)){
                    $0.resizable()
                } placeholder: {
                    //이미지를 데이터 통신하면서 아직 데이터가 오지 않았을때, 준비중이라고 표시
                    ProgressView()
                }
                .frame(width: 200, height: 200)
                
            }
            .padding()
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
