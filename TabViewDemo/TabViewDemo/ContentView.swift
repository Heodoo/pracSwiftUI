//
//  ContentView.swift
//  TabViewDemo
//
//  Created by 허두영 on 2022/10/26.
//

import SwiftUI

struct ContentView: View {
    //탭 위치
    @State private var tabSelection = 6
    
    var body: some View {
        //탭뷰는 아이템이 5개 이상되면 5번쨰가 ...으로 바뀜
        // ... 안에 리스트형식으로 이동할수 있는 링크가 생김
        // 이런 특성으로 5개까지만 만드는것으로 권장됨
        TabView(selection: $tabSelection){
            //탭아이템은 텍스트와 이미지 컴포넌트 각 1개까지만 들어갈 수 있음
            NavigationView{
                SecondView()}.tabItem {
                    Image(systemName: "house.fill")
                    Text("Tab Label 1")
                        .tag(1)
                }
            SecondView().tabItem {
                Image(systemName: "house.fill")
                Text("Tab Label 2")
                    .tag(2)
            }
            SecondView().tabItem {
                Image(systemName: "house.fill")
                Text("Tab Label 3")
                    .tag(3)
            }
            SecondView().tabItem {
                Image(systemName: "house.fill")
                Text("Tab Label 4")
                    .tag(4)
            }
            Text("Tab Content 5").tabItem {
                Text("Tab Label 5")
                    .tag(5)
            }
            Text("Tab Content 1").tabItem {
                Text("Tab Label 1")
                    .tag(6)
            }
            
        }
    }
}
struct SecondView : View {
    var body: some View {
        List{
            NavigationLink(destination: ThirdView()) {
                VStack{
                    Text("hello world")
                }
            }
        }
        .navigationTitle(Text("Hello World"))
        
    }
}

struct ThirdView : View {
    var body: some View {
        List{
            Text("hi World")
                .font(.largeTitle)
        }
        .navigationTitle(Text("hi world"))
        
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
