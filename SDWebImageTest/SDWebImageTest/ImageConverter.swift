//
//  ImageConverter.swift
//  SDWebImageTest
//
//  Created by MacBook on 2023/07/26.
//

import SwiftUI
import SDWebImageSwiftUI
import PhotosUI
import SDWebImageWebPCoder
import MobileCoreServices
import libwebp

@MainActor
class ImageConverter: ObservableObject {
    @Published var image: Image?
    @Published var photo: PhotosPickerItem?
    @Published var imageData: Data?
    @Published var webpData: Data?
    
    func encodeImageToWebp(uiImage: UIImage) async{
        dump(#function)
        
        //let downSampled = await
        let webpData = await encodeData(uiImage: uiImage)
        NSLog("End encode")
        print("webpdata:\(String(describing: webpData))")
    }
    
    func encodeData(uiImage: UIImage) async -> Data? {
        dump(#function)
        uiImage.jpegData(compressionQuality: <#T##CGFloat#>)
        //limit output file size <= 1MB
        let options: [SDImageCoderOption: Any] = [.encodeCompressionQuality: 0.1,.encodeMaxFileSize: 1024 * 10]
        let data = SDImageWebPCoder.shared.encodedData(with: uiImage, format: .webP, options: options)
        return data
    }
    
    func loadImageFromWebp(uiImage: UIImage) async{
        dump(#function)
        self.image = Image(uiImage: uiImage)
    }
    
    func downSample(at data: Data, to pointSize: CGSize, scale: CGFloat) async -> UIImage? {
        let imageSourceOptions = [kCGImageSourceShouldCache: false] as CFDictionary
        guard let imageSource = CGImageSourceCreateWithData(data as CFData, imageSourceOptions)  else {
            return nil
        }
        
        let maxDimensionInPixels = max(pointSize.width, pointSize.height) * scale
        let downsampleOptions = [
            kCGImageSourceCreateThumbnailFromImageAlways: true,
            kCGImageSourceShouldCacheImmediately: true,
            kCGImageSourceCreateThumbnailWithTransform: true,
            kCGImageSourceThumbnailMaxPixelSize: maxDimensionInPixels
        ] as [CFString : Any] as CFDictionary
        
        guard let downsampledImage = CGImageSourceCreateThumbnailAtIndex(imageSource, 0, downsampleOptions) else {
            return UIImage()
        }
        return UIImage(cgImage: downsampledImage)
    }
    
    func convertUIImageToCGImageSource(_ image: UIImage) -> CGImageSource? {
        guard let imageData = image.pngData() else {
            return nil
        }

        guard let dataProvider = CGDataProvider(data: imageData as CFData) else {
            return nil
        }

        let options: [CFString: Any] = [
            kCGImageSourceTypeIdentifierHint: kUTTypePNG // 이미지 타입을 PNG로 지정합니다.
        ]

        return CGImageSourceCreateWithDataProvider(dataProvider, options as CFDictionary)
    }
    
}
