//
//  ContentView.swift
//  Typography_mangham
//
//  Created by 허두영 on 2022/10/27.
//

import SwiftUI

struct ContentView: View {
    var sampleText = "SwiftUI는 모든 Apple 플랫폼에서 사용자 인터페이스를 구축하는 혁신적이고 새로운 방법으로, 코드를 적게 쓰면서 더 나은 앱을 만들 수 있습니다. 읽기 쉽고 작성하기 편한 선언적 Swift 구문을 통해 SwiftUI는 새로운 Xcode 디자인 도구와 매끄럽게 연동하면서 코드와 디자인이 완벽하게 동기화되도록 합니다. 또한 유동적 글자 크기 조절, 다크 모드, 현지화 및 손쉬운 사용을 자동 지원하므로 SwiftUI 코딩 첫 줄부터 가장 강력한 UI 코드를 작성할 수 있습니다."
    
    @State private var fontSize : CGFloat =  12
    @State private var letterSpace : CGFloat = 0
    @State private var lineSpace : CGFloat = 0
    //글줄사이보다 글자사이가 크면 세로로 읽힘
    var body: some View {
        ScrollView(){
            VStack{
                HStack{
                    Label("글자크기",systemImage: "").font(.system(size: 12))
                    Slider(value: $fontSize, in: -24...40)
                }
                
                    HStack{
                        Label("글자사이",systemImage: "").font(.system(size: 12))
                        Slider(value: $letterSpace, in: -24...40)
                    }
                
                    HStack{
                        Label("글줄사이",systemImage: "").font(.system(size: 12))
                        Slider(value: $lineSpace, in: -24...40)
                    }
                Text(sampleText).kerning(letterSpace).lineSpacing(lineSpace).font(.system(size: fontSize))
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
