//
//  SecondView.swift
//  TimerWithEnvironment
//
//  Created by 허두영 on 2022/10/24.
//

import SwiftUI

struct SecondView: View {
    @EnvironmentObject var timerData : TimerData
    var body: some View {
        NavigationView{
            VStack {
                Text("Second View")
                    .font(.largeTitle)
                Text("Timer Count: \(timerData.timerCount)")
                    .font(.headline)
                
                NavigationLink(destination:
                                ThirdView()) {
                    Text("Next Screen")
                }
                                .padding()
            }
            .padding()
            
        }
    }
}

//struct SecondView_Previews: PreviewProvider {
//    static var previews: some View {
//        SecondView()
//    }
//}
