//
//  NamesView.swift
//  HelloSwiftUI
//
//  Created by 허두영 on 2022/10/18.
//

import SwiftUI

struct NamesView: View {
    var body: some View {
        Text("Hello, 상호 ").foregroundColor(.blue).font(.title)
        Text("Hello, 시현 ").foregroundColor(.accentColor).font(.callout)
        Text("Hello, 정우 ").foregroundColor(.brown).font(.caption)
        Text("Hello, 광현 ").foregroundColor(.black).font(.caption2)
        Text("Hello, 태영 ").foregroundColor(.cyan).font(.footnote)
        Text("Hello, 예린 ").foregroundColor(.green).font(.title2)
        Text("Hello, 다영 ").foregroundColor(.indigo).font(.title3)
        Text("Hello, 두영 ").foregroundColor(.mint).font(.subheadline).fontWeight(.heavy).italic(true).padding(EdgeInsets(top: 10, leading: 50, bottom: 20, trailing: 50))
    }
}
