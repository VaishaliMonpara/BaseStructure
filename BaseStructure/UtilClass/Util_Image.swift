//
//  Util_Image.swift
//  TapARideApp
//
//  Created by MAC0008 on 24/09/18.
//  Copyright © 2018 MAC0008. All rights reserved.
//

import UIKit

class Util_Image: NSObject {
    static func compressImage(image:UIImage,isForThumb:Bool) -> UIImage
    {
        var CompressImage = image.correctlyOrientedImage()
        // var CompressImage = image.
        var actualHeight = CompressImage.size.height
        var actualWidth = CompressImage.size.width

        let maxHeight:CGFloat
        let maxWidth:CGFloat

        if isForThumb
        {
            maxHeight = 700
            maxWidth = 700

        }
        else
        {
            maxHeight = 720
            maxWidth =  1280
        }

        var imageRetio:CGFloat = actualWidth/actualHeight
        let maxRetio:CGFloat = maxWidth/maxHeight
        print(image.imageOrientation)

        let compressionQuality:CGFloat = 0.0 // 0 percent compression
        if actualHeight > maxHeight || actualWidth > maxWidth
        {
            if imageRetio < maxRetio
            {
                imageRetio = maxHeight/actualHeight
                actualWidth = imageRetio * actualWidth
                actualHeight = maxHeight
            }
            else if imageRetio > maxRetio
            {
                imageRetio = maxWidth/actualWidth
                actualWidth = imageRetio * actualHeight
                actualHeight = maxWidth

            }
            else
            {
                actualHeight = maxHeight
                actualWidth = maxWidth
            }
            let rect = CGRect.init(x: 0.0, y: 0.0, width: actualWidth, height: actualHeight)
            UIGraphicsBeginImageContext(rect.size)
            CompressImage.draw(in: rect)
            if CompressImage.imageOrientation == .up
            {
                print("True")
            }
            let img = UIGraphicsGetImageFromCurrentImageContext()
            let imageData = img!.jpegData(compressionQuality: compressionQuality)
            UIGraphicsEndImageContext()
            CompressImage = UIImage(data:imageData!)!
            CompressImage.imageOrientation
        }
        return CompressImage
    }
}
