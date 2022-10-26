//
//  ContentView.swift
//  ListDemoAgain
//
//  Created by 허두영 on 2022/10/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            List {
                NavigationLink(destination: {
                    HelloView()
                }) {
                    
                        HStack{
                            Image(systemName: "globe")
                                .imageScale(.large)
                                .foregroundColor(.accentColor)
                            Text("Hello, world!")
                        }
                }
                
                
            }
            //.padding()
        }
    }
}

struct HelloView: View {
    var body: some View {
        VStack {
            
                HStack{
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text("Hello, world!")
                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
