//
//  ConversationViewController.swift
//  MyChat
//
//  Created by Сергей Прокопьев on 26/04/2019.
//  Copyright © 2019 someThing. All rights reserved.
//

import UIKit

class ConversationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .red
    }
    
    // test
    var testProp: String! {
        didSet {
            navigationItem.title = testProp
        }
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
