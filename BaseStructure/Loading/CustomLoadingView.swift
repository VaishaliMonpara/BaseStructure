//
//  CustomLoadingView.swift
//  NaftaliTaxiApp
//
//  Created by MAC0008 on 10/09/18.
//  Copyright © 2018 MAC0008. All rights reserved.
//

import UIKit

class CustomLoadingView: UIView
{
    var viewColor : UIColor?
    var indicatorColor : UIColor?
    var lableColor : UIColor?
    var parentView : UIView?
    var containerView : UIView?
    var lableFont : UIFont?
    var lableText : NSString?
    var isMask : Int?
    

//    init()
//    {
//        super.init()
//
//        isMask = 0
//        setupProperty()
//    }
//
//    convenience init(_ isMask: Int)
//    {
//        self.init()
//        self.isMask = isMask
//        self.setupProperty()
//    }
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        isMask = 0
        setupProperty()
    }
    
    convenience init(_ isMask: Int)
    {
        self.init(frame: CGRect.zero)
        self.isMask = 1
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showProgress(_ parentView: UIView?)
    {
        self.parentView = parentView
        setupView()
    }
    
    func showMaskProgress(_ parentView: UIView?)
    {
        self.parentView = parentView
        setupMaskView()
    }
    
    func setupView()
    {
        let screenRect: CGRect = UIScreen.main.bounds
        let screenWidth: CGFloat = screenRect.size.width
        let screenHeight: CGFloat = screenRect.size.height
        
        frame = CGRect(x: screenWidth / 2 - 20, y: screenHeight / 2 - 20, width: 40, height: 40)
        layer.cornerRadius = 20.0
        setupImage(self)
        if isMask == 1
        {
            setupMainMaskView()
        }
        else
        {
            setupMainView()
        }
    }
    
    
    // MARK: setup for MaskBound
    func setupMaskView()
    {
        frame = (parentView?.frame)!
        backgroundColor = UIColor.clear
        containerView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        containerView?.center = center
        containerView?.backgroundColor = UIColor.white
        containerView?.layer.cornerRadius = 20.0
        
        setupImage(containerView)
        if let aView = containerView
        {
            addSubview(aView)
        }
        self.setShadowforTitle(containerView)
        if isMask == 1
        {
            setupMainMaskView()
        }
        else
        {
            setupMainView()
        }
    }
    
    func removeProgress()
    {
        if parentView != nil
        {
            if containerView != nil
             {
                containerView?.removeFromSuperview()
            }
            removeFromSuperview()
        }
    }
    
    
    // MARK: Set Property
    func setupProperty()
    {
        let screenRect: CGRect = UIScreen.main.bounds
        let screenWidth: CGFloat = screenRect.size.width
        let screenHeight: CGFloat = screenRect.size.height
        frame = CGRect(x: screenWidth / 2 - 20, y: screenHeight / 2 - 20, width: 40, height: 40)
        layer.cornerRadius = 20
        backgroundColor = UIColor.white
    }
    
    
    // MARK: set up Image
    func setupImage(_ containerView: UIView?)
    {
        let url: URL? = Bundle.main.url(forResource: "myLoading", withExtension: "gif")
        let imgview = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        if let anUrl = url
        {
            do
            {
                let imageData = try Data(contentsOf: anUrl as URL)
                imgview.image = UIImage.animatedImage(withAnimatedGIFData: imageData)
            }
            catch
            {
                print("Unable to load data: \(error)")
            }
        }
        imgview.layer.cornerRadius = 20.0
        self.setShadowforTitle(containerView)
        containerView?.addSubview(imgview)
    }
    
    
    // MARK: setup Main View
    func setupMainView()
    {
        self.layer.cornerRadius = 20
        parentView?.addSubview(self)
        parentView?.bringSubviewToFront(self)
    }
    
    func setupMainMaskView()
    {
        (UIApplication.shared.delegate!.window!!).addSubview(self)
        (UIApplication.shared.delegate!.window!!).bringSubviewToFront(self)
//        win.addSubview(self)
//        win.bringSubview(toFront: self)
    }
    
    func setShadowforTitle(_ imgview: UIView?)
    {
        imgview?.layer.borderColor = UIColor.gray.cgColor
        imgview?.layer.borderWidth = 0.5
        imgview?.layer.shadowColor = UIColor.gray.cgColor
        imgview?.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        imgview?.layer.shadowOpacity = 1
    }

}
