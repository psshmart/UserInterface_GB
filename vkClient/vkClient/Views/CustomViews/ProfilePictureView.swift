//
//  ProfilePictureView.swift
//  vkClient
//
//  Created by Svetlana Safonova on 25.09.2021.
//

import UIKit

@IBDesignable class ProfilePictureView: UIView {
    
    private var borderColor: CGColor = UIColor(red: 169 / 255, green: 72 / 255, blue: 72 / 255, alpha: 0.9).cgColor

    @IBInspectable var shadowRadius: CGFloat = 3 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0.8
    @IBInspectable var shadowColor: UIColor = UIColor(red: 96 / 255, green: 10 / 255, blue: 10 / 255, alpha: 1)
   
    @IBOutlet var imageView: UIImageView!
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let shadowView = UIView(frame: CGRect(x: 0, y: 0, width: layer.bounds.width, height: layer.bounds.height))
        shadowView.layer.borderWidth = 2.5
        shadowView.layer.borderColor = borderColor
        shadowView.layer.shadowColor = shadowColor.cgColor
        shadowView.layer.shadowOpacity = shadowOpacity
        
        shadowView.layer.shadowRadius = shadowRadius
        shadowView.layer.cornerRadius = imageView.bounds.height/2
        shadowView.layer.masksToBounds = false
        shadowView.layer.shadowOffset = CGSize.zero
        addSubview(shadowView)
    }
    
    override func awakeFromNib() {
        backgroundColor = .clear
        imageView.layer.cornerRadius = imageView.bounds.height/2
        
       
        
        
    }
}
