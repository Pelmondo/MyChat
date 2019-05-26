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
        label.text = "example text"
        label.numberOfLines = 0
        return label
    }()
    
    let bubbleBackgroundView : UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.layer.cornerRadius = 14
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var leadingConstraint: NSLayoutConstraint!
    var trailConstraint: NSLayoutConstraint!
//    Разделение сообщений на входящие и исходящие
    var chatMessage : Message! {
        didSet {
            bubbleBackgroundView.backgroundColor = chatMessage.isComing ? .white : .darkGray
            textMessageLabel.textColor = chatMessage.isComing ? .black : .white
            
            textMessageLabel.text = chatMessage.message
            
            if chatMessage.isComing {
                leadingConstraint.isActive = true
                trailConstraint.isActive = false
            } else {
                leadingConstraint.isActive = false
                trailConstraint.isActive = true
            }
        }
    }
   
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        backgroundColor = .clear
        
        addSubview(bubbleBackgroundView)
        addSubview(textMessageLabel)
    
        layoutSetting()
    }
    
    func layoutSetting() {

        let constraint = [
            textMessageLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),
            textMessageLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -24),
            textMessageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
            
            bubbleBackgroundView.topAnchor.constraint(equalTo: textMessageLabel.topAnchor, constant: -16),
            bubbleBackgroundView.bottomAnchor.constraint(equalTo: textMessageLabel.bottomAnchor, constant: 16),
            bubbleBackgroundView.leadingAnchor.constraint(equalTo: textMessageLabel.leadingAnchor, constant: -16),
            bubbleBackgroundView.trailingAnchor.constraint(equalTo: textMessageLabel.trailingAnchor, constant: 16),
        ]
        
        NSLayoutConstraint.activate(constraint)
        
        leadingConstraint = textMessageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32)
        leadingConstraint.isActive = true
        
        trailConstraint = textMessageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
        trailConstraint.isActive = false
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
