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
    @State private var selectedPhotos : [PhotosPickerItem] = []
    @State private var selectedImages : [UIImage] = []
    @State private var webpImage: WebImage?
    @State private var selectedPhoto: PhotosPickerItem?
    @State private var selectedImage: Image?
    @State private var selectedUImage: UIImage?
    
    @ObservedObject var imageConverter = ImageConverter()
    
    var body: some View {
        
        
        VStack {
            if let webpImage {
                webpImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200, alignment: .center)
            }
            
            
            if let image = imageConverter.image {
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200, alignment: .center)
            }
            
            
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
                    if let data = try? await photo?.loadTransferable(type: Data.self) {
                        if let uiImage = UIImage(data: data) {
                            let image = Image(uiImage: uiImage)
                            imageConverter.image = image
                            await imageConverter.encodeImageToWebp(uiImage: uiImage)
                        }
                    }
                }
            })
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


