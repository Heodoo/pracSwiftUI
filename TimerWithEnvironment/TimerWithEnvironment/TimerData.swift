//
//  TimerData.swift
//  TimerWithEnvironment
//
//  Created by 허두영 on 2022/10/24.
//

import SwiftUI
import Foundation
import Combine

class TimerData : ObservableObject {
    @Published var timerCount = 0
    var timer : Timer?
    
    init() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerDidFire), userInfo: nil, repeats: true)
    }
    
    @objc func timerDidFire() {
        timerCount += 1
    }
    
    func resetCount() {
        timerCount = 0
    }
}
