//
//  ConversationListViewController.swift
//  MyChat
//
//  Created by Сергей Прокопьев on 03/04/2019.
//  Copyright © 2019 someThing. All rights reserved.
//

import UIKit

class ConversationListViewController: UITableViewController {
    
    private let cellID = "ConvCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        tableView.register(ConversationsTableViewCell.self, forCellReuseIdentifier: cellID)
       
    }

    // MARK: -  Setup NavigationBar
    private func setupNavigationBar() {
        
        navigationItem.title = "My Chat" // set Title name
//        navigationController?.navigationBar.prefersLargeTitles = true
        let profileButton = UIButton(type: .system)
        profileButton.setImage(#imageLiteral(resourceName: "Shape"), for: .normal)
        profileButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        profileButton.contentMode = .scaleAspectFit
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: profileButton)
        profileButton.addTarget(self, action: #selector(moveToProfile), for: .touchUpInside)
    }
    // Test
    @objc func moveToProfile() {
        present(ProfileViewController(), animated: true)
    }
    
    // MARK: - Table view data source
    var messages : [Message] = [
        Message(name: "Serga", message: "Hi everyone!", isComing: true),
        Message(name: "Nasya", message: "How are You?", isComing: false),
        Message(name: "Oleg", message:"Long messages Long messages Long messages Long messages Long messages Long messages" , isComing: true)
        
    ]
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Online" : "History"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return messages.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ConversationsTableViewCell
        cell.lastMessageLabel.text = messages[indexPath.row].message
        cell.nameLebel.text = messages[indexPath.row].name
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let conversation = ConversationViewController()
        conversation.testProp = messages[indexPath.row].name
        navigationController?.pushViewController(conversation, animated: true)
    }


}
