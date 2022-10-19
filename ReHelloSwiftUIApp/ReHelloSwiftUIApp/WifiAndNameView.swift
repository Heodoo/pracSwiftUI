//
//  wifiAndNameView.swift
//  ReHelloSwiftUIApp
//
//  Created by 허두영 on 2022/10/19.
//

import SwiftUI

struct WifiAndNameView: View {
    
    @SwiftUI.State private var userName: String = ""
    @SwiftUI.State private var wifiEnable: Bool = false
    var body: some View {
        
        //바인딩 username 현재 값을 받아올때는 $ 붙이기 <- 관측
        VStack{
            TextField("이름을 입력하세요",text: $userName)
            //텍스트필드에서 받아서 갱신된 username을 텍스트로 다시 보여주기
            Text(userName)
            NameResultView(userName2: $userName)
            
            Toggle(isOn: $wifiEnable) {
                Text("Wi-Fi ON/OFF")
            }
            HStack{
                Image(systemName: wifiEnable ? "wifi" : "wifi.slash")
                Text(wifiEnable ? "Wi-Fi ON" : "Wi-Fi OFF")
            }
            WifiResultView(wifiEnable2: $wifiEnable)
        }
        .padding()
        .font(.largeTitle)
        
    }
}

struct NameResultView: View {
    @Binding var userName2: String
    
    var body: some View {
            TextField("이름을 입력하세요2",text: $userName2)
            Text(userName2)
    }
}


struct WifiResultView: View {
    // 바인딩 프로퍼티는 미리 초기화하면 안됨, 이 프로퍼티를 가진 뷰를 호출할때 초기화
    @Binding var wifiEnable2: Bool
    
    var body: some View {
        HStack{
            Image(systemName: wifiEnable2 ? "wifi" : "wifi.slash")
            Text(wifiEnable2 ? "Wi-Fi ON2" : "Wi-Fi OFF2")
        }
    }
}


struct WifiAndNameView_Previews: PreviewProvider {
    static var previews: some View {
        WifiAndNameView()
    }
}
