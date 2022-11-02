//
//  MyUILabel.swift
//  PracticeUIKitInSwiftUI
//
//  Created by 허두영 on 2022/11/02.
//
// Text가 UILabel 기능 다 수행가능, 예시를 위해 한번 해본거임 ScroollView 와 UIScrollView 도 마찬가지


import SwiftUI

// SwiftUI 에서 UIKit 기능을 추가할때는 UIViewRepresentable 프로토콜을 따라야한다.
struct MyUILabel : UIViewRepresentable {
    var text : String
    // UIView 기반 컴포넌트의 인스턴스를 생성하고 필요한 초기화 작업을 수행한 뒤 반환하는 역활을 한다
    func makeUIView(context: UIViewRepresentableContext<MyUILabel>) -> UILabel {
        let myLabel = UILabel()
        myLabel.text = text
        return myLabel
    }
    
    //UIView 자체를 업데이트 해야하는 변경이 SwiftUI 뷰에서 생길 떄마다 호출된다
    func updateUIView(_ uiView: UILabel, context: UIViewRepresentableContext<MyUILabel>) {
        //필요한 작업을 수행한다
        
    }
    
}
