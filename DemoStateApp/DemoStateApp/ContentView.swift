//
//  ContentView.swift
//  DemoStateApp
//
//  Created by 허두영 on 2022/10/24.
//

import SwiftUI

struct ContentView: View {
    @State var myString: String = ""
    var body: some View {
        //컴포넌트들만 나열해야함, 제어문 정도만 가능
        VStack {
            //텍스트필드안에 텍스트가 바뀌면 myString 값도 변함
            TextField("여기에 텍스트를 입력해주세요",text: $myString)
            //print("\(myString)") 에러
            Text("\(myString)")
            wifiView()
            
        }
        .padding()
        
        
    }
}

struct wifiView: View {
    @State private var wifiEnable : Bool = true
    
    @State private var userName : String = ""
    
    
    var body: some View {
        VStack {
            Toggle(isOn: $wifiEnable){
                Text("Enable Wi-Fi")
            }
            TextField("Enter user name", text:  $userName)
            Text("\(userName)")
            
            //Image(systemName: wifiEnable ? "wifi" : "wifi.slash")
            
            WifiImageView(wifiEnable: $wifiEnable)
            
            
            NavigationView {
                NavigationLink(destination: SecondView(wifiEnable: $wifiEnable)){
                    Text("Push")
                        .padding()
                }
                
            }
            
            
            
        }
        .padding()
    }
}

struct WifiImageView: View {
    //바인딩은 초기값 불가
    @Binding var wifiEnable: Bool
    
    var body: some View {
        VStack {
            Image(systemName: wifiEnable ? "wifi" : "wifi.slash")
        }
    }
}

struct SecondView: View {
    @Binding var wifiEnable: Bool
    var body: some View {
        NavigationView {
            VStack {
                Toggle(isOn: $wifiEnable){
                    Text("Enable Wi-Fi")
                }
                Image(systemName: wifiEnable ? "wifi" : "wifi.slash")
                Text("Detail")
            }
            .navigationTitle(Text("Detail"))
            
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
    }
}
