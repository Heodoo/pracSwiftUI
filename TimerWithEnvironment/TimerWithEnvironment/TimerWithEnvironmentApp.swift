//
//  TimerWithEnvironmentApp.swift
//  TimerWithEnvironment
//
//  Created by 허두영 on 2022/10/24.
//

import SwiftUI


@main
struct TimerWithEnvironmentApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(TimerData())
        }
    }
}
