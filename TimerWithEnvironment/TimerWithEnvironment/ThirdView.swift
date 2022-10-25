//
//  ThirdView.swift
//  TimerWithEnvironment
//
//  Created by 허두영 on 2022/10/24.
//

import SwiftUI

struct ThirdView: View {
    @EnvironmentObject var timerData : TimerData
    var body: some View {
        NavigationView{
            VStack {
                Text("Third View")
                    .font(.largeTitle)
                Text("Timer Count: \(timerData.timerCount)")
                    .font(.headline)
            }
            .padding()
        }
    }
}
//
//struct ThirdView_Previews: PreviewProvider {
//    static var previews: some View {
//        ThirdView()
//    }
//}
