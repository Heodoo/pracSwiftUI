//
//  GraphView.swift
//  DrawDemo2
//
//  Created by 허두영 on 2022/10/27.
//

import SwiftUI

let colors =  [Color.red, Color.yellow,
    Color.green, Color.blue, Color.purple]

var randomCGFloats:[CGFloat] = [ CGFloat.random(in: 1..<100),
    CGFloat.random(in: 1..<100),
    CGFloat.random(in: 1..<100),
    CGFloat.random(in: 1..<100),
    CGFloat.random(in: 1..<100)
]
var randomCGFloats2:[CGFloat] = Array(repeating: CGFloat.random(in: 1..<100),count: 5)

struct GraphView: View {
    var body: some View {
        ZStack{
            GraphShape(points: randomCGFloats)
                .stroke(style: StrokeStyle(lineWidth: 3))
                .fill(.black)
            HStack(spacing: -60){
                Rectangle()
                    .path(in: CGRect(x: 30, y: 100, width: 60, height: randomCGFloats[0]))
                    .fill(colors[0])
                Rectangle()
                    .path(in: CGRect(x: 30, y: 100, width: 60, height: randomCGFloats[1]))
                    .fill(colors[1])
                
                Rectangle()
                    .path(in: CGRect(x: 30, y: 100, width: 60, height: randomCGFloats[2]))
                    .fill(colors[2])
                Rectangle()
                    .path(in: CGRect(x: 30, y: 100, width: 60, height: randomCGFloats[3]))
                    .fill(colors[3])
                Rectangle()
                    .path(in: CGRect(x: 30, y: 100, width: 60, height: randomCGFloats[4]))
                    .fill(colors[4])
            }
        }
        .padding()
    }
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        GraphView()
    }
}

struct GraphShape : Shape {
    var points : [CGFloat]
    var w : CGFloat = 60
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: w, y:points[0]))
        path.addLine(to: CGPoint(x: w*2, y:points[1]))
        path.addArc(tangent1End: CGPoint(x: w*2, y:points[1]), tangent2End: CGPoint(x: w*2, y:points[2]), radius: 100)
        path.addLine(to: CGPoint(x: w*3, y:points[2]))
        path.addLine(to: CGPoint(x:w*4, y:points[3]))
        path.addLine(to: CGPoint(x:w*5, y:points[4]))
        return path
    }
    
    
}
