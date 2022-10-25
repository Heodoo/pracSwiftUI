//
//  SecondVIew.swift
//  TimerDemo2
//
//  Created by 허두영 on 2022/10/24.
//

import SwiftUI

struct SecondVIew: View {
    @ObservedObject var timerData: TimerData
    //@EnvironmentObject Object var timerData: TimerData
    
    var body: some View {
        VStack{
            Text("Second View")
                .font(.largeTitle)
            Text("Timer count = \(timerData.timerCount)")
            Button(action: timerData.resetCount) {
                Text("reset")
            }
            .padding()
        }
    }
}

struct SecondVIew_Previews: PreviewProvider {
    static var previews: some View {
        SecondVIew(timerData: TimerData())
    }
}
