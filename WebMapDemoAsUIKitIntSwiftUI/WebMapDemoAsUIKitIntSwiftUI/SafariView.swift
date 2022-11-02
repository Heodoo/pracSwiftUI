//
//  SafariView.swift
//  WebMapDemoAsUIKitIntSwiftUI
//
//  Created by 허두영 on 2022/11/02.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable  {
    let url: URL
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        
        let view = SFSafariViewController(url: url)
        return view
    }
    
    //사피리에는 보안이 책임져있음, 추적기능이 없음
    //구글같은 경우 찾아본 웹에 추적하여 광고를 넣기 위해 추적기능이 있음
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {
        //...
    }
    
    
}



//struct SafariView_Previews: PreviewProvider {
//    static var previews: some View {
//        SafariView(url: URL(string: "https://www.likelion.net")!)
//    }
//}
