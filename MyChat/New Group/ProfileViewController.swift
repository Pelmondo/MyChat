//
//  ViewController.swift
//  MyChat
//
//  Created by Сергей Прокопьев on 02/04/2019.
//  Copyright © 2019 someThing. All rights reserved.
//

import UIKit
import Foundation

class ProfileViewController: UIViewController {
    
    // settings for UI elements
    let PhotoimageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "placeholderuser")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let nameLabel: UILabel = {
        
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Some Name"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let aboutLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "asfhdjaslfh asdlfhajdshf ladjhf adbflajbf ilaerhwaieljrljan fabdsbfljhdf lkdsajfhja aldsfhjahdf lfdh ladjhf adbflajbf ilaerhwaieljrljan fabdsbfljhdf lkdsajfhja aldsfhjahdf"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 20)
    
       return label
    }()
    
    let changeButton: UIButton = {
        
       let button = UIButton()
       button.setTitle("Редактировать", for: .normal)
       button.setTitleColor(.gray, for: .normal)
       button.addTarget(self, action:#selector(changeButtonClicked), for: .touchUpInside )
       button.backgroundColor = .white
       button.layer.cornerRadius = 8
       button.translatesAutoresizingMaskIntoConstraints = false
        
       return button
    }()
    
    let photoButton: UIButton = {
        
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "applephotos"), for: .normal)
        button.addTarget(self, action: #selector(photoButtonClicked), for: .touchUpInside)
        button.layer.cornerRadius = 8
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let backButton: UIButton = {
        
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "Cancel"), for: .normal)
        button.addTarget(self, action: #selector(backToConversations), for: .touchUpInside )
        button.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        
      return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Profile"// Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(backToConversations))
        view.backgroundColor = UIColor(white: 0.95, alpha: 1)
        
        addSubView()
        setUpLayout()
    }
    
    private func addSubView() {
        
        view.addSubview(PhotoimageView)
        view.addSubview(nameLabel)
        view.addSubview(aboutLabel)
        view.addSubview(changeButton)
        view.addSubview(photoButton)
        view.addSubview(backButton)
        
    }
    
    // Navigation
    @objc func backToConversations() {
        
        dismiss(animated: true)
    }
    
    
    //MARK: - Layout settings
    private func setUpLayout() {
        
        let constraints = [
            //Setting photo
            PhotoimageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 80),
            PhotoimageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            PhotoimageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            PhotoimageView.widthAnchor.constraint(equalToConstant: self.view.frame.size.width),
            PhotoimageView.bottomAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 50),
            
            //Setting name
            nameLabel.topAnchor.constraint(equalTo: PhotoimageView.bottomAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 16),
            nameLabel.bottomAnchor.constraint(equalTo: aboutLabel.topAnchor,constant: 0),
            
            //Setting discriptions
            aboutLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 0),
            aboutLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 16),
            aboutLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            
            //Setting buttons
            changeButton.topAnchor.constraint(greaterThanOrEqualTo: aboutLabel.bottomAnchor, constant: 8),
            changeButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,constant: -18),
            changeButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 16),
            changeButton.heightAnchor.constraint(equalToConstant: 50),
            
            photoButton.topAnchor.constraint(greaterThanOrEqualTo: aboutLabel.bottomAnchor, constant: 8),
            photoButton.heightAnchor.constraint(equalTo: changeButton.heightAnchor),
            photoButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            photoButton.leadingAnchor.constraint(equalTo: changeButton.trailingAnchor,constant: 5),
            photoButton.widthAnchor.constraint(equalToConstant: 50),
            photoButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -18),
            
            backButton.bottomAnchor.constraint(equalTo: PhotoimageView.topAnchor, constant: -4),
            backButton.widthAnchor.constraint(equalToConstant: 34),
            backButton.heightAnchor.constraint(equalToConstant: 34),
            backButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 5)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    //MARK: - Change button settings
    @objc func changeButtonClicked() {
        print("Button Clicked")
    }

    
    // MARK: - Settings photo button
    @objc func photoButtonClicked() {
        print("Photo button clicked")
        let alert = UIAlertController(title: "Выбрать фото", message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Галерея", style: .default, handler: { _ in
            self.openGallary()
        }))
        
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: { _ in
            NSLog("Отмена")
        }))
        
        
        self.present(alert,animated: true, completion: nil)
    }
    
    
    private func openGallary(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        //If you dont want to edit the photo then you can set allowsEditing to false
        imagePicker.allowsEditing = true
        imagePicker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        self.present(imagePicker, animated: true, completion: nil)
    }
    
}

