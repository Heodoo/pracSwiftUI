//
//  ContentView.swift
//  MyLittleTv
//
//  Created by Jongwook Park on 2022/12/01.
//

import SwiftUI

struct Channel: Identifiable {
    let id = UUID()
    let name: String
    let address: String
}

let channels: [Channel] = [
    Channel(name: "내가 좋아하는 영상", address: "https://www.w3schools.com/html/mov_bbb.mp4"),
    Channel(name: "즐겨 보는 거", address: "https://www.w3schools.com/html/mov_bbb.mp4"),
    Channel(name: "우울할 때 보기", address: "https://www.w3schools.com/html/mov_bbb.mp4"),
    Channel(name: "저작권 문제 없는 영상", address: "https://www.w3schools.com/html/mov_bbb.mp4"),
]

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(channels) { channel in
                NavigationLink {
                    PlayerView()
                } label: {
                    HStack {
                        Image(systemName: "popcorn")
                        Text(channel.name)
                    }
                }
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
