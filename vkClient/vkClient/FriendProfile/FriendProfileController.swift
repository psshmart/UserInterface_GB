//
//  FriendProfileController.swift
//  vkClient
//
//  Created by Svetlana Safonova on 19.09.2021.
//

import UIKit

class FriendProfileController: UICollectionViewController {
    
    private let reuseIdentifier = "profilePicture"
    
    var profilePicture: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        let backView = UIView()
        backView.addSubview(UIImageView(image: UIImage(named: "background")))
        collectionView.backgroundView = backView
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ProfilePictureCell else {
            return UICollectionViewCell()
        }
    
        cell.profileImageView?.image = profilePicture
    
        return cell
    }
}
