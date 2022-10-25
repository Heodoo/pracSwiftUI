//
//  ContentView.swift
//  TimerWithEnvironment
//
//  Created by 허두영 on 2022/10/24.
//

import SwiftUI

//!!! 꼭 다시 읽어보기
// EnviromentObject vs ObservableObject
//EnviromentObject는 여러 뷰에서 바로 접근가능
//하지만 ObservedObject는 다른 뷰에서 접근할때 하위 뷰로 내려가면서 옵저버브드객체를 넘겨줘야함
//그렇다고해서 EnvrimentObject가 능사는 아니다
//EnvrimentObject를 가진 클래스 코드 자체가 복잡해지고 사용하는 파일이 늘어나면 코드가 복잡해질 수 있기 때문이다
//다음 뷰로 간단하게 넘길때는 ObservedObject가 더 간결하고 이득일 수 있다

struct ContentView: View {
    @EnvironmentObject var timerData : TimerData
    var body: some View {
        NavigationView {
            VStack{
                Text("Timer Count : \(timerData.timerCount)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                Button(action: timerData.resetCount) {
                    Text("reset count")
                }
                
                
                NavigationLink(destination:
                                SecondView()) {
                    Text("Next Screen")
                }
                                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(TimerData())
    }
}
