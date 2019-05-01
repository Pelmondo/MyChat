//
//  StructuresConversation.swift
//  MyChat
//
//  Created by Сергей Прокопьев on 27/04/2019.
//  Copyright © 2019 someThing. All rights reserved.
//

import Foundation
import UIKit

// Type Message
struct Message {
    let name : String
    let message : String
    let isComing : Bool
    
    init( name:String, message:String, isComing:Bool ) {
        
        self.isComing = isComing
        self.message = message
        self.name = name
    }
    //TODO: -
    //  Date
    
}
