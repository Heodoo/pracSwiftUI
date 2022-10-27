//
//  FigureView.swift
//  DrawDemo
//
//  Created by 허두영 on 2022/10/27.
//

import SwiftUI

struct FigureView: View {
    var body: some View {
        VStack {
            Text("Hello, Rectangle!")
                .font(.largeTitle)
            Rectangle()
                .fill(.blue)
            Text("Hello, Cirlcle!")
                .font(.largeTitle)
            Circle()
                .fill(.red)
                .frame(width: 100, height: 100)
            Text("Hello, Capsule")
                .font(.largeTitle)
            Capsule()
                .stroke(lineWidth: 10)
                .foregroundColor(.purple)
                .frame(width: 200,height: 50)
            Text("Hello, RoundRectangle")
                .font(.largeTitle)
            RoundedRectangle(cornerRadius: CGFloat(20))
                .stroke(style: StrokeStyle(lineWidth: 10, dash: [10,10]))
            
            Text("Hello, Ellipse")
                .font(.headline)
            Ellipse()
                .stroke(style: StrokeStyle(lineWidth: 5,dash: [10,5,20]))
                .frame(width: 300,height: 50)
        }
        .padding()
    }
}

struct FigureView_Previews: PreviewProvider {
    static var previews: some View {
        FigureView()
    }
}
