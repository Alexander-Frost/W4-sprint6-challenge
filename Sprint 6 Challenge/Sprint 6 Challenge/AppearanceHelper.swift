//
//  AppearanceHelper.swift
//  Sprint 6 Challenge
//
//  Created by Alex on 5/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class AppearanceHelper {
   
    // setup theme
    static func theme(){
        let textAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = textAttributes
        UINavigationBar.appearance().barTintColor = .red
        UINavigationBar.appearance().tintColor = .white
    }
}
var finishEditing: Bool = false
