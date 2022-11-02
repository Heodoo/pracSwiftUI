//
//  ContentView.swift
//  AnimalPicker
//
//  Created by 허두영 on 2022/11/02.
//

import SwiftUI

struct ContentView: View {
    @State var imagePickerVisible: Bool = false
    @State var selectedImage: Image? = Image(systemName: "photo")
    var body: some View {
        ZStack{
            VStack {
                selectedImage?
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Button(action: {
                    imagePickerVisible.toggle()
                }) {
                    Text("Select an Image")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()
                        .background(.blue)
                    
                }
            }//VStack
            .padding()
            if(imagePickerVisible){
                MyImagePicker(imagePickerVisible: $imagePickerVisible, selectedImage: $selectedImage)
            }
            
        }//ZStack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
