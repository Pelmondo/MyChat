//
//  ConversationsTableViewCell.swift
//  MyChat
//
//  Created by Сергей Прокопьев on 03/04/2019.
//  Copyright © 2019 someThing. All rights reserved.
//

import UIKit

class ConversationsTableViewCell: UITableViewCell {
    
    let lastMessageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameLebel: UILabel = {
        let label = UILabel()
        label.text = "Hesting Name"
        label.textColor = .green
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lastDateLabel: UILabel = {
        let label = UILabel()
        label.text = "25.01.2019"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
    
        addSubview(lastMessageLabel)
        addSubview(nameLebel)
        addSubview(lastDateLabel)
        //MARK: - Layout settings
        let constraints = [
            nameLebel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            nameLebel.bottomAnchor.constraint(equalTo: lastMessageLabel.topAnchor,constant: -8),
            nameLebel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameLebel.widthAnchor.constraint(equalToConstant: 250),
//            nameLebel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
//
//            lastMessageLabel.topAnchor.constraint(equalTo: nameLebel.bottomAnchor,constant: 8),
            lastMessageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            lastMessageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            lastMessageLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            lastDateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            lastDateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            lastDateLabel.leadingAnchor.constraint(greaterThanOrEqualTo: nameLebel.trailingAnchor, constant: 8),
            lastDateLabel.bottomAnchor.constraint(equalTo: lastMessageLabel.topAnchor, constant: -8)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    

    
}
