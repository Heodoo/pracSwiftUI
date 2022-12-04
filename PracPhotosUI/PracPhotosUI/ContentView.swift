//
//  ContentView.swift
//  PracPhotosUI
//
//  Created by MacBook on 2022/12/05.
// 탭바형 자동배너 + PhotosUI (로컬 이미지(사진첩) 추가하기)

import SwiftUI
// iOS 16 새로나온 기술
import PhotosUI

struct ContentView: View {
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var currentIndex = 0 {
          didSet {
              if currentIndex == selectedImages.count {
                  currentIndex = 0
              }
          }
      }
    
    @State private var selectedPhotos : [PhotosPickerItem] = []
    @State private var selectedImages : [UIImage] = []
    
    var body: some View {
        VStack {
            TabView (selection: $currentIndex) {
                ForEach(0..<selectedImages.count,id:\.self) { idx in
                    Image(uiImage: selectedImages[idx])
                        .resizable()
                        .aspectRatio(contentMode: .fill).tag(idx)
                }
            }
            .tabViewStyle(.page)
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .frame(height: 180)
            
            
            //matching .images 이미지를 포함겠다
            // not(.livePhotos) 라이브이미지 제외
            // HDR 이미지는 안들어가네?
            // 아이템들 선택하고 추가할때 중복된 이미지는 따로 처리해주어야함 (아직 미구현)
            // 현재는 중복된 것을 add 하면 중복하여 add함
            
            PhotosPicker(selection: $selectedPhotos,
                         matching: .any(of: [.images,.not(.videos)])) {
                HStack{
                    Image(systemName: "photo")
                    Text("Select your photo")
                }
                .foregroundColor(.white)
                .padding(10)
                .buttonStyle(.borderedProminent)
                .background(.black)
            }.onChange(of: selectedPhotos) { newValues in
                for newValue in newValues {
                    Task {
                        if let imageData = try? await newValue.loadTransferable(type: Data.self), let image = UIImage(data: imageData) {
                            //Image로 바로 전달하기엔 한계가 있음, UIImage 는 Hashable
                            selectedImages.append(image)
                        }
                    }
                }
            }
        }
        .padding()
        .onReceive(timer) { input in
            if !(selectedImages.count == 0){
                currentIndex += 1
            }
            print(currentIndex)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
