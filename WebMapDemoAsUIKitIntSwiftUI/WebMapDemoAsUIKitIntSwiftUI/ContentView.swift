//
//  ContentView.swift
//  WebMapDemoAsUIKitIntSwiftUI
//
//  Created by 허두영 on 2022/11/02.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelection: Int = 1
    var body: some View {
        TabView(selection: $tabSelection) {
            WebTapView().tabItem {
                Image(systemName: "safari")
                Text("Web") }.tag(1)
            MapTapView().tabItem {
                Image(systemName: "map")
                Text("Map") }.tag(2)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
