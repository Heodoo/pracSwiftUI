//
//  DemoData.swift
//  DemoObserverApp
//
//  Created by 허두영 on 2022/10/24.
//

import SwiftUI

class DemoData : ObservableObject {
    
    //Published 는 "다음의 값이 바뀌면 알려주겠다" 라는 의미
    //2. 구체적으로 이런 내용들이 바뀔 예정이다.
    @Published var userCount: Int = 0
    @Published var currentUser: String = ""
    
    init(){
        updateData()
    }
    
    func updateData() {
        userCount += 1
        currentUser = "ned"
    }
}
