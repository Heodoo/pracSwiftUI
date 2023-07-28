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


// UIImage 를 관리하는 객체
class ImageConverter: ObservableObject {
    @Published var uiImage: UIImage?
    @Published var photo: PhotosPickerItem?
    @Published var webpData: Data?
    
    func encodeImageToWebp(uiImage: UIImage) async{
        dump(#function)
        
        guard let data = uiImage.pngData() else {
            NSLog("Encode failed: wrong data")
            return
        }
        
        guard let downSampledUIImage = await downSample(at: data, to: CGSize(width: 200, height: 200), scale: 2) else {
            NSLog("Encode failed: failed down sampled image")
            return
        }
        self.uiImage = downSampledUIImage
        
        guard let webpData = await encodeData(uiImage: downSampledUIImage) else {
            NSLog("Encode failed: failed uiimage to webpdata encode")
            return
        }
        self.webpData = webpData
        
        
        NSLog("Success: End encode")
        print("webpdata:\(String(describing: webpData))")
    }
    
    // Encode UIImage to webp image data
    func encodeData(uiImage: UIImage) async -> Data? {
        dump(#function)
        //limit output file size <= 10KB
        let options: [SDImageCoderOption: Any] = [.encodeCompressionQuality: 0.1,.encodeMaxFileSize: 1024 * 10]
        let data = SDImageWebPCoder.shared.encodedData(with: uiImage, format: .webP, options: options)
        return data
    }
    
    // Down sampling UIImage data type,and return down sampled UIImage
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
    
}
