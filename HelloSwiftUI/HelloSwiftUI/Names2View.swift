//
//  Names2View.swift
//  HelloSwiftUI
//
//  Created by 허두영 on 2022/10/18.
//

import SwiftUI

var data = ["Heo","doo","yeong"]

struct Names2View: View {
    var body: some View {
        VStack{
            Text("Hello, 상호 ").modifier(StandardName())
            Text("Hello, 시현 ").padding()
            Text("Hello, 정우 ").padding()
            Text("Hello, 광현 ").padding()
            Text("Hello, 태영 ").padding()
            Text("Hello, 예린 ").padding()
            Text("Hello, 다영 ").padding()
            Text("Hello, 두영 ").padding()
        }.foregroundColor(.mint).font(.title2).fontWeight(.heavy).italic(true)
    }
}
struct StandardName: ViewModifier {
    func body(content: Content) -> some View {
        content.foregroundColor(Color.purple)
            .font(.body)
            .padding()
        //print("content")
        //return content
    }
}

struct Names2View_Previews: PreviewProvider {
    static var previews: some View {
        Names2View()
    }
}
