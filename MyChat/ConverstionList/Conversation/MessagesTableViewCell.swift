//
//  MessagesTableViewCell.swift
//  MyChat
//
//  Created by Сергей Прокопьев on 29/04/2019.
//  Copyright © 2019 someThing. All rights reserved.
//

import UIKit

class MessagesTableViewCell: UITableViewCell {

    
    let textMessageLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Example message!"
        label.numberOfLines = 0
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubview(textMessageLabel)
        
        layoutSetting()
    }
    
    func layoutSetting() {

        let constraint = [
            textMessageLabel.topAnchor.constraint(equalTo: self.topAnchor),
            textMessageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            textMessageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)

        ]
        
        NSLayoutConstraint.activate(constraint)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
