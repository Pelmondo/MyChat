//
//  ConversationViewController.swift
//  MyChat
//
//  Created by Сергей Прокопьев on 26/04/2019.
//  Copyright © 2019 someThing. All rights reserved.
//

import UIKit

class ConversationViewController: UIViewController {
   
    
    let tableView : UITableView = {
       let table = UITableView()
       table.separatorStyle = .none
       table.backgroundColor = UIColor(white: 0.95, alpha: 1)
       return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        //SubView
        view.addSubview(tableView)
        //TableView setting
        tableVSetting()
        // LayoutConstraint
        setUpConstraint()
    }
    
    // test
    var userName : String = "User" {
        didSet {
            navigationItem.title = userName
        }
    }
    
    var messages : [Message] = [
        Message(name: "", message: "Hello", isComing: true),
        Message(name: "", message: "How are you? What are you doing here?", isComing: true),
        Message(name: "", message: "So long message for you, from me about your and my exams, suka so dificult i can,t do this shit, maybe you can help me please...", isComing: true),
        Message(name: "", message: "Hello", isComing: false),
        Message(name: "", message: "How are you? What are you doing here?", isComing: false),
        Message(name: "", message: "So long message for you, from me about your and my exams, suka so dificult i can,t do this shit, maybe you can help me please...", isComing: false)
    ]
    
    private let cellName = "CellId"
    

    // NSLayoutConstraint
    func setUpConstraint() {
        
        let constraint = [
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(constraint)
    }
    
    //TableView setting
    private func tableVSetting() {
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MessagesTableViewCell.self, forCellReuseIdentifier: cellName)
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}


extension ConversationViewController: UITableViewDelegate, UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as! MessagesTableViewCell
        cell.chatMessage = messages[indexPath.row]
        return cell
    }
    
    
    
}
