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
       return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .red
        
        //SubView
        view.addSubview(tableView)
        //TableView setting
        tableVSetting()
        // LayoutConstraint
        setUpConstraint()
    }
    
    // test
    var testProp : String = "User" {
        didSet {
            navigationItem.title = testProp
        }
    }
    
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as! MessagesTableViewCell
        return cell
    }
    
    
    
}
