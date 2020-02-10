//
//  UIImage+Oriantation.swift
//  

import UIKit

extension UIImage
{
    func correctlyOrientedImage() -> UIImage
    {
        if self.imageOrientation == UIImage.Orientation.up
        {
            return self
        }
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        self.draw(in: CGRect.init(x: 0, y: 0, width: self.size.width, height: self.size.height))
        let normalizedImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!;
        UIGraphicsEndImageContext();
        return normalizedImage;
    }
}
