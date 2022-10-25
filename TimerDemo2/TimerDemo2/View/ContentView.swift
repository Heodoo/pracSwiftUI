//
//  ContentView.swift
//  TimerDemo2
//
//  Created by 허두영 on 2022/10/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var timerData: TimerData = TimerData()
    //@EnvironmentObject Object var timerData: TimerData 
    
    var body: some View {
        NavigationView{
            VStack {
                Text("Timer count = \(timerData.timerCount)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                Button(action: timerData.resetCount) {
                    Text("reset")
                }
                NavigationLink(destination:
                    {
                    SecondVIew(timerData: TimerData())
                    //SecondVIew().environmentObject(timerData)
                }) {
                    Text("Next Screen")
                }
                .padding()
                
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(timerData: TimerData())
    }
}
