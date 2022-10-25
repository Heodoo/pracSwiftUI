//
//  TimerData.swift
//  TimerDemo2
//
//  Created by 허두영 on 2022/10/24.
//

import Foundation
//시간처리가 필요한 기능을 구현한 앱을 만들때 Timer 굉장히 유용, 그런 상황에 이 코드를 참고하기
class TimerData: ObservableObject {
    // timerCount가 바뀌면 뷰를 다시 그리라고 알려줄게
    @Published var timerCount: Int = 0
    // Timer 는 NSObect를 상속받는 objc에서 온 클래스임
    var timer: Timer?
    
    init() {
        // objc로 만들어진 클래스를 이용할 때 #selector를 사용해 함수를 전달해줄수 있음
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerDidFire), userInfo: nil, repeats: true)
    }
    
    @objc func timerDidFire() {
        timerCount += 1
    }
    
    func resetCount() {
        timerCount = 0
    }
}
