//
//  ContentView.swift
//  SDWebImageTest
//
//  Created by MacBook on 2023/07/26.
//

import SwiftUI
import SDWebImageSwiftUI
import PhotosUI

struct ContentView: View {
    @State private var image: Image?
    @State private var webpImage: WebImage?
    
    @ObservedObject var imageConverter = ImageConverter()
    
    var body: some View {
        
        
        VStack {
            // webp image url 불러오기 테스트
            if let webpImage {
                webpImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200, alignment: .center)
            }else{
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(width: 200, height: 200, alignment: .center)
            }
            
            // 선택한 사진
            if let image = imageConverter.uiImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200, alignment: .center)
            }else{
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(width: 200, height: 200, alignment: .center)
            }
            
            // PhotosUI 사진 선택기
            PhotosPicker(selection: $imageConverter.photo) {
                HStack{
                    Image(systemName: "photo")
                    Text("Select your photo")
                }
                .foregroundColor(.white)
                .padding(10)
                .buttonStyle(.borderedProminent)
                .background(.black)
            }
            .onChange(of: imageConverter.photo, perform: { photo in
                Task {
                    if let photo, let data = try? await photo.loadTransferable(type: Data.self) {
                        if let uiImage = UIImage(data: data) {
                            await imageConverter.encodeImageToWebp(uiImage: uiImage)
                        }
                    }
                }
            })//onChange
        }
        .padding()
        .onAppear{
            
            webpImage = WebImage(url: URL(string: "https://www.gstatic.com/webp/gallery/4.sm.webp"))
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


