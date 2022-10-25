//
//  TimerDemo2App.swift
//  TimerDemo2
//
//  Created by 허두영 on 2022/10/24.
//

import SwiftUI

//단순하게 한 화면에서 입력값 받아 처리할 거라면 State
//이어지는 화면에 걸쳐서 넘기고 영향을 받아야한다면 Observable
//여러 화면, 거의 모든 화면에 걸치는 데이터라면 Environment



@main
struct TimerDemo2App: App {
    var body: some Scene {
        WindowGroup {
            ContentView(timerData: TimerData())
        }
    }
}
