//
//  OlympicRingsView.swift
//  DrawDemo2
//
//  Created by 허두영 on 2022/10/27.
//

import SwiftUI
var arr: [CGRect] = [
    CGRect(x: 30, y: 100, width: 100, height: 100),
    CGRect(x: 90, y: 150, width: 100, height: 100),
    CGRect(x: 150, y: 100, width: 100, height: 100),
    CGRect(x: 210, y: 150, width: 100, height: 100),
    CGRect(x: 270, y: 100, width: 100, height: 100)
]
struct OlympicRingsView: View {
    var body: some View {
        ZStack{
            Circle()
                .path(in: arr[0])
                .stroke(style: StrokeStyle(lineWidth: 10))
                .fill(.blue)
            
            Circle()
                .path(in: arr[1])
                .stroke(style: StrokeStyle(lineWidth: 10))
                .fill(.yellow)
            Circle()
                .path(in: arr[2])
                .stroke(style: StrokeStyle(lineWidth: 10))
                .fill(.black)
            Circle()
                .path(in: arr[3])
                .stroke(style: StrokeStyle(lineWidth: 10))
                .fill(Color.green)
            Circle()
                .path(in: arr[4])
                .stroke(style: StrokeStyle(lineWidth: 10))
                .fill(.red)

            //.fill(RadialGradient(colors: [Color.green], center: .center, startRadius: CGFloat(30), endRadius: CGFloat(100)))
            
        }
    }
}

struct OlympicRingsView_Previews: PreviewProvider {
    static var previews: some View {
        OlympicRingsView()
    }
}
