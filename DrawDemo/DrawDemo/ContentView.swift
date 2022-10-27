//
//  ContentView.swift
//  DrawDemo
//
//  Created by 허두영 on 2022/10/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            FigureView().tabItem {
                Text("Figure")
            }.tag(1)
            OverlayView().tabItem {
                Text("Overlay")
            }.tag(2)
            PathView().tabItem {
                Text("Path")
            }.tag(3)
            
            Path2View().tabItem {
                Text("Path2")
            }.tag(4)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
