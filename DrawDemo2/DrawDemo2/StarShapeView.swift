//
//  StarShapeView.swift
//  DrawDemo2
//
//  Created by 허두영 on 2022/10/27.
//

import SwiftUI

struct StarShapeView: View {
    let colors = Gradient(colors: [Color.red, Color.yellow,
                                   Color.green, Color.blue, Color.purple])
    var body: some View {
        ZStack{
            StarShape(startX:30,startY: 30,edge: 200)
                .fill(.green)
            StarShape(startX:10,startY: 60,edge: 200)
                .fill(.red)
            StarShape(startX:70,startY: 200,edge: 300)
                .fill(.yellow)
            StarShape(startX:30,startY: 400,edge: 200)
                .stroke(style: StrokeStyle(lineWidth: 10))
                .fill(.blue)
            StarShape(startX:100,startY: 450,edge: 400)
                .fill(.orange)
        }
    }
}
struct StarShape : Shape {
    var startX : CGFloat = 0
    var startY : CGFloat = 0
    var edge : CGFloat = 0
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: startX + 0, y:startY +  edge * 0.34))
        path.addLine(to: CGPoint(x:startX +  edge, y:startY +  edge*0.34))
        path.addLine(to: CGPoint(x: startX + edge/2.0-edge*0.3, y:startY + edge))
        path.addLine(to: CGPoint(x:startX +  edge/2, y:startY + 0))
        path.addLine(to: CGPoint(x:startX + edge/2.0+edge*0.3 , y:startY + edge))
        path.addLine(to: CGPoint(x:startX +  0, y:startY + edge*0.34))
        path.closeSubpath()
        return path
    }
    
    
}


struct StarShapeView_Previews: PreviewProvider {
    static var previews: some View {
        StarShapeView()
    }
}
