//
//  ContentView.swift
//  PracticeUIKitInSwiftUI
//
//  Created by 허두영 on 2022/11/02.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MyScrollView(text: "UIView in SwiftUI")
//            VStack {
//                Image(systemName: "globe")
//                    .imageScale(.large)
//                    .foregroundColor(.accentColor)
//                Text("Hello, world!")
//                //UIKit 컴포넌트는 SwiftUI 컴포넌트와 달리 자동적으로 위치나 레이아웃들이 설정되지 않아 따로 설정을 추가해주어야한다
//                MyUILabel(text: "Hello")
//            }
//            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
