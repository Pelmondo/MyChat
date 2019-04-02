//
//  ViewController.swift
//  MyChat
//
//  Created by Сергей Прокопьев on 02/04/2019.
//  Copyright © 2019 someThing. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    let imageView = UIImageView()
    let nameLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Profile"// Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor(white: 0.95, alpha: 1)
        
        // Image add
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.translatesAutoresizingMaskIntoConstraints = false
//        imageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width)
        
        
        view.addSubview(imageView)
        imageView.image = UIImage(named: "placeholderuser")
        imageView.contentMode = .scaleAspectFit
//
        let constraints = [
            imageView.topAnchor.constraint(equalTo: self.view.topAnchor),
            imageView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            imageView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            imageView.widthAnchor.constraint(equalToConstant: self.view.frame.size.width + 12)
//            imageView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
//            imageView.heightAnchor.constraint(equalTo: self.view.widthAnchor)
//            imageView.heightAnchor.constraint(equalT: self.view.widthAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
        
        //nameLabel add
//        nameLabel.frame = CGRect
        
    }


}

