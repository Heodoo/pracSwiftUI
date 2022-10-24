//
//  ContentView.swift
//  DemoStateApp
//
//  Created by 허두영 on 2022/10/24.
//

import SwiftUI

//ObservableObject는 클래스만 따를 수 있음, struct 불가
//ObservableObject 의 의미는, "이거 지켜봐줘" 라는 의미
//1.내부의 내용들이 바뀔 예정이다.


struct ContentView: View {
    @State private var wifiEnable : Bool = true
    @EnvironmentObject var demoData: DemoData
    
    var body: some View {
        VStack{
            Text("안니영")
            Divider()
            NavigationView {
                VStack{
                    Text("userCount : \(demoData.userCount)")
                        .padding()
                    Text("currentUser: \(demoData.currentUser)")
                        .padding()
                    Button(action: { demoData.updateData()
                        
                    }) {
                        Text("Update data")
                    }
                    .padding()
                    
                    NavigationLink(destination: SecondView(wifiEnable: $wifiEnable)) {
                        Text("Push")
                            .padding()
                    }
                }
                //title bartitle 차이를 모르겠네?
                .navigationTitle("Master1")
                .navigationBarTitle(Text("Master2"))
                .padding()
                
            }
        }
        .padding()
    }
}



struct SecondView: View {
    @EnvironmentObject var demoData: DemoData
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
        ContentView().environmentObject(DemoData())
    }
}
