//
//  FriendCell.swift
//  vkClient
//
//  Created by Svetlana Safonova on 19.09.2021.
//

import UIKit

class FriendCell: UITableViewCell {

    
    @IBOutlet weak var profilePictureView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
