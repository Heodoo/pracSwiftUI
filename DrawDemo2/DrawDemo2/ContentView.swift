//
//  ContentView.swift
//  DrawDemo2
//
//  Created by 허두영 on 2022/10/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination: { OlympicRingsView() }) {
                    Text("오륜기")
                        .font(.largeTitle)
                }
                .padding()
                
                NavigationLink(destination: { StarShapeView() }) {
                    Text("커스텀별")
                        .font(.largeTitle)
                }
                .padding()
                
                NavigationLink(destination: { GraphView() }) {
                    Text("그래프")
                        .font(.largeTitle)
                }
                .padding()
                
                
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
