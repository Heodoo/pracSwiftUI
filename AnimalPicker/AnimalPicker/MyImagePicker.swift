//
//  MyImagePicker.swift
//  AnimalPicker
//
//  Created by 허두영 on 2022/11/02.
//

import SwiftUI

// 아직 SwiftUI에는 imagePicker 가 없음,애플에서 SwiftUI imagePicker를 개발할때까지 이 코드를 이용해야함
//사파리웹을 띄울때도 UIKit을 이용해야함

struct MyImagePicker : UIViewControllerRepresentable {
    @Binding var imagePickerVisible: Bool
    @Binding var selectedImage: Image?
    
    func makeUIViewController(context:  UIViewControllerRepresentableContext<MyImagePicker>) -> UIImagePickerController  {
        let picker = UIImagePickerController()
        //
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<MyImagePicker>) {
        //...
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(imagePickerVisible: $imagePickerVisible,selectedImage: $selectedImage)
    }
    
    class Coordinator : NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        @Binding var imagePickerVisible: Bool
        @Binding var selectedImage: Image?
        
        init(imagePickerVisible: Binding<Bool>, selectedImage: Binding<Image?>) {
            //_로 해야 잘되네? 왜지?, self로는 안됨
            //바인딩된 프로퍼티를 전달하려면 _를 붙여하는 듯?
            //이름때매 그런줄알고 이름을 안겹치게 바꿔봐도 self와 똑같은 에러
            //Cannot assign value of type 'Binding<Bool>' to type 'Bool'
            //이름바꾸고 _붙여도 가능
            _imagePickerVisible = imagePickerVisible
            _selectedImage = selectedImage
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            imagePickerVisible = false
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let image: UIImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            
            //UIImage를 swiftUI Image 로
            selectedImage = Image(uiImage: image)
        }
        
        
    }
    
    
}
