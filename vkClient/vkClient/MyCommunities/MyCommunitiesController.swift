//
//  MyCommunitiesController.swift
//  vkClient
//
//  Created by Svetlana Safonova on 19.09.2021.
//

import UIKit

class MyCommunitiesController: UITableViewController {
    var group: [Group] = [
        Group(groupName: "First Community", groupPicture: UIImage(named: "cat")),
        Group(groupName: "Second Community", groupPicture: UIImage(named: "cat")),
        Group(groupName: "Third Community", groupPicture: UIImage(named: "cat")),
        Group(groupName: "Fourth Community", groupPicture: UIImage(named: "cat")),
        Group(groupName: "Fifth Community", groupPicture: UIImage(named: "cat")),
        Group(groupName: "Sixth Community", groupPicture: UIImage(named: "cat")),
        Group(groupName: "Seventh Community", groupPicture: UIImage(named: "cat"))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Communities"
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as! CommunityCell
        cell.groupImageView.image = group[indexPath.row].groupPicture
        cell.groupNameLabel.text = group[indexPath.row].groupName
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            group.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    @IBAction func addCommunity(segue: UIStoryboardSegue) {
        if segue.identifier == "addCommunity" {
            guard let allCommunitiesController = segue.source as? AllCommunitiesController else {
                return
            }
            if let indexPath = allCommunitiesController.tableView.indexPathForSelectedRow {
                let community = allCommunitiesController.group[indexPath.row]
                if !group.contains(community) {
                    group.append(community)
                    tableView.reloadData()
                }
            }
        }
    }
}
