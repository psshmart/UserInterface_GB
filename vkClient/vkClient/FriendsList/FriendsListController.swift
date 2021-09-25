//
//  FriendsListController.swift
//  vkClient
//
//  Created by Svetlana Safonova on 19.09.2021.
//

import UIKit

class FriendsListController: UITableViewController {

    var friends: [User] = [
        User(name: "Naruto", surname: "Uzumaki", profileImage: UIImage(named: "naruto")),
        User(name: "Sasuke", surname: "Uchiha", profileImage: UIImage(named: "sasuke")),
        User(name: "Sakura", surname: "Haruno", profileImage: UIImage(named: "sakura")),
        User(name: "Kakashi", surname: "Hatake", profileImage: UIImage(named: "kakashi")),
        User(name: "Hinata", surname: "Hyuga", profileImage: UIImage(named: "hinata")),
        User(name: "Shikamaru", surname: "Nara", profileImage: UIImage(named: "shika")),
        User(name: "Temari", surname: "Nara", profileImage: UIImage(named: "temari")),
        User(name: "Itachi", surname: "Uchiha", profileImage: UIImage(named: "itachi")),
        User(name: "Tsunade", surname: "Senju", profileImage: UIImage(named: "tsunade")),
        User(name: "Konan", surname: "", profileImage: UIImage(named: "konan")),
        User(name: "Yahiko", surname: "", profileImage: UIImage(named: "Yahiko"))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        friends.sort(by: { $0.surname < $1.surname } )
        title = "Friends"
        setupBackgroundView()
        setupTransparentBar()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friends.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friend", for: indexPath) as! FriendCell
        cell.nameLabel.text = friends[indexPath.row].name
        cell.surnameLabel.text = friends[indexPath.row].surname
        cell.profilePictureCell.image = friends[indexPath.row].profileImage
        cell.selectionStyle = .default
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "friendProfile" {
            if let nextViewController = segue.destination as? FriendProfileController {
                guard let indexPath = tableView.indexPathForSelectedRow else { return }
                nextViewController.profilePicture = friends[indexPath.row].profileImage
                nextViewController.title = "\(friends[indexPath.row].name) \(friends[indexPath.row].surname)"
            }
        }
    }
}

extension UITableViewController {
    func setupBackgroundView() {
        let backView = UIView()
        backView.addSubview(UIImageView(image: UIImage(named: "background")))
        tableView.backgroundView = backView
    }
    
    func setupTransparentBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.view.backgroundColor = .clear
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.hidesBarsOnSwipe = true
    }
}


