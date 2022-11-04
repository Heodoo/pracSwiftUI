//
//  ContentView.swift
//  SFSymbols_testApp
//
//  Created by 허두영 on 2022/11/03.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var variableColorValue : Double = 0
    var body: some View {
        VStack {
            HStack{
                //wifi를 찾고있는
                // 움직이는 이미지를 보여주고 싶을떄
                // variableColorVlue를 계속 수정하면
                //그런 이미지를 만들어낼 수 있다
                Image(systemName: "wifi", variableValue: variableColorValue)
                    .renderingMode(.original)
                    .font(.system(size: 300))
            }
            Slider(value: $variableColorValue, in: 0...1)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
