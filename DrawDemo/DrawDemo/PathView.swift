//
//  PathView.swift
//  DrawDemo
//
//  Created by 허두영 on 2022/10/27.
//

import SwiftUI

struct PathView: View {
    var body: some View {
        VStack{
            Path { path in
                path.move(to: CGPoint(x: 10, y: 0))
                path.addLine(to: CGPoint(x: 10, y: 300))
                path.addLine(to: CGPoint(x: 300, y: 350))
                path.closeSubpath()
            }
            .stroke(style: StrokeStyle(lineWidth: 5))
            
            MyShape()
                .fill(.green)
        }
        .padding()
    }
}

struct MyShape : Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // 도형을 정의하기 코드는 여기에 추가...
        path.move(to: CGPoint(x: 10, y: 0))
        path.addLine(to: CGPoint(x: 10, y: 300))
        path.addLine(to: CGPoint(x: 300, y: 350))
        path.closeSubpath()
        
        
        return path
    }
}


struct PathView_Previews: PreviewProvider {
    static var previews: some View {
        PathView()
    }
}
