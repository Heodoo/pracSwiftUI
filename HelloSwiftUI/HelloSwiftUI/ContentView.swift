//
//  ContentView.swift
//  HelloSwiftUI
//
//  Created by 허두영 on 2022/10/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //VStack 은 10개까지 그 이상은 List
        VStack {
            TitleView()
            //Names2View()
            Button("hello") {
                print("hello")
            }
            
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
            .previewDisplayName("iPhone 14 Pro")
        ContentView().previewDevice(PreviewDevice(rawValue: "iPhone 14"))
            .previewDisplayName("iPhone 14")
    }
}
