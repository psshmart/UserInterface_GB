//
//  AllCommunitiesController.swift
//  vkClient
//
//  Created by Svetlana Safonova on 19.09.2021.
//

import UIKit

class AllCommunitiesController: UITableViewController {
    var group: [Group] = [
        Group(groupName: "First Community", groupPicture: UIImage(named: "cat")),
        Group(groupName: "Second Community", groupPicture: UIImage(named: "cat")),
        Group(groupName: "Third Community", groupPicture: UIImage(named: "cat")),
        Group(groupName: "Fourth Community", groupPicture: UIImage(named: "cat")),
        Group(groupName: "Fifth Community", groupPicture: UIImage(named: "cat")),
        Group(groupName: "Sixth Community", groupPicture: UIImage(named: "cat")),
        Group(groupName: "Seventh Community", groupPicture: UIImage(named: "cat")),
        Group(groupName: "Eighth Community", groupPicture: UIImage(named: "cat")),
        Group(groupName: "Ninth Community", groupPicture: UIImage(named: "cat")),
        Group(groupName: "Tenth Community", groupPicture: UIImage(named: "cat")),
        Group(groupName: "Eleventh Community", groupPicture: UIImage(named: "cat")),
        Group(groupName: "Twelfth Community", groupPicture: UIImage(named: "cat")),
        Group(groupName: "Thirteenth Community", groupPicture: UIImage(named: "cat")),
        Group(groupName: "Fourteenth Community", groupPicture: UIImage(named: "cat"))
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "All Communities"
        setupBackgroundView()
        setupTransparentBar()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return group.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newGroupCell", for: indexPath) as! CommunityCell
        cell.groupImageView?.image = group[indexPath.row].groupPicture
        cell.groupNameLabel.text = group[indexPath.row].groupName
        return cell
    }
}
