//
//  WebTapView.swift
//  WebMapDemoAsUIKitIntSwiftUI
//
//  Created by 허두영 on 2022/11/02.
//

import SwiftUI

struct WebTapView: View {
    @State private var isShowingSheet = false
    var body: some View {
        VStack{
            Button(action: {
                isShowingSheet.toggle()
            }) {
                Text("Open Web Browser")
            }
        }
        .sheet(isPresented: $isShowingSheet,onDismiss: didDismiss) {
            WebSheetView(isShowingSheet: $isShowingSheet)
        }
    }
    
    func didDismiss() {
        // handle the dismissing action.
    }
    
}

//ModalView
//모달로 보이게 하는것을 Sheet 라고함
struct WebSheetView: View {
    @Binding var isShowingSheet : Bool
    var body: some View {
        SafariView(url: URL(string: "https://www.likelion.net")!)
        Button(action: {
            isShowingSheet.toggle()
        }) {
            Text("dismiss")
        }
    }
}


//struct WebTapView_Previews: PreviewProvider {
//    static var previews: some View {
//        WebTapView()
//    }
//}
