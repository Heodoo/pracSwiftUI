//
//  HelloView.swift
//  ReHelloSwiftUIApp
//
//  Created by 허두영 on 2022/10/19.
//

import SwiftUI
//let cloLabel: ()-> any View = {
//   return Image(systemName: "car")
//}()

//let cloAction : ()->Void = {
//    print("clo action")
//}
//
//let cloLabel: Label = {
//   Image(systemName: "car")
//}()


struct HelloView: View {
    var body: some View {
        VStack{
            //Button(action: cloAction, label: cloLabel)
            
            //요소끼리 20Px 씩 띄어줌, 패딩필요없음
            VStack(spacing: 20){
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)//.modifier(StandardHello())
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                
            }.modifier(StandardHello())
            
            MyVStack{
                Text("Hi, World! 1")
                    //.modifier(StandardHello())
                Text("Hi, World! 2")
                    //.modifier(StandardHello())
                Text("Hi, World! 3")
                    .modifier(StandardHello())
                Text("Hi, World! 4")
                    .modifier(StandardHello())
            }//.modifier(StandardHello())
        }
    }
}

struct MyVStack<Content: View>: View {
    let content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        VStack(spacing: 10){
            content()
            content()
        }.modifier(StandardHello2())
    }
}


struct StandardHello: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.largeTitle)
    }
    
}

struct StandardHello2: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.orange)
            .padding()
    }
    
}

struct HelloView_Previews: PreviewProvider {
    static var previews: some View {
        HelloView()
    }
}
