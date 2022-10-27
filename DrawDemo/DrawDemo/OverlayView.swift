//
//  OverlayView.swift
//  DrawDemo
//
//  Created by 허두영 on 2022/10/27.
//

import SwiftUI

struct OverlayView: View {
    var body: some View {
        VStack {
            Ellipse()
                .fill(Color.red)
                .overlay(
                    Ellipse()
                        .stroke(Color.blue, lineWidth: 10)
                )
                .frame(width: 250, height: 150)
        }
        .padding()
    }
}

struct OverlayView_Previews: PreviewProvider {
    static var previews: some View {
        OverlayView()
    }
}
