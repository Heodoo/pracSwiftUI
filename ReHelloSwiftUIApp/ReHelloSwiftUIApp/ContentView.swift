//
//  ContentView.swift
//  ReHelloSwiftUIApp
//
//  Created by 허두영 on 2022/10/19.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            Text("매출1")
                .font(.title)
                .padding(.bottom, 30.0 )
            HStack(alignment: .top) {
                Text("1분기 판매")
                    .font(.headline)
                Spacer()
                VStack(alignment: .trailing) {
                    Text("1월")
                    Text("2월")
                    Text("3월")
                }
                Spacer()
                VStack(alignment: .leading){
                    Text("$1000")
                    Text("$100")
                    Text("$3200")
                }
            }
            HStack {
                Image(systemName: "airplane")
                Text("Flight times: ")
                Text("LONDON").layoutPriority(1)
            }
            .font(.largeTitle)
            .lineLimit(1)
            
            Text("Hello world\n thank you \n hou much \n asdasddasdas")
                .font(.largeTitle)
                //.border(Color.blue,width: 3)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0,maxHeight: .infinity, alignment: .center)
                .padding(5)
                .border(Color.black, width: 3)
            
            
            
            
            //VStack 에는 10개의 요소만 넣을 수 있어서 텍스트를 더 추가하면 에러
            //하지만 Group으로 묶으면 그룹을 하나의 요소로 봐서 더 추가할 수 있다.
            Group{
                Text("매출9")
                Text("매출10")
                Text("매출11")
            }
            
        }
        .padding(15)
        .edgesIgnoringSafeArea(.all)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ContentView()
        }
    }
}
