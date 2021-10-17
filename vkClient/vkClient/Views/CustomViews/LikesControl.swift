//
//  LikesControl.swift
//  vkClient
//
//  Created by Svetlana Safonova on 02.10.2021.
//

import UIKit

class LikesControl: UIControl {
    
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var likeLabel: UILabel!
    
    private var likeTapped: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        likeLabel.text = "0"
        likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
    }
    
    @objc func likeButtonTapped() {
        likeTapped.toggle()
        
        if likeTapped {
            likeButton.setImage(UIImage(systemName: "suit.heart.fill"), for: .normal)
            likeLabel.text = "1"
        } else {
            likeButton.setImage(UIImage(systemName: "suit.heart"), for: .normal)
            likeLabel.text = "0"
        }
    }
}
