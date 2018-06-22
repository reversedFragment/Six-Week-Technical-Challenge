//
//  NameListController.swift
//  Sex Week Technical Challenge
//
//  Created by Ben Adams on 6/22/18.
//  Copyright © 2018 Ben Adams. All rights reserved.
//

import Foundation

class NameListController {
    
    // MARK: Properties
    
    var nameList: [String] = ["Badams", "Other Badmen", "Trautman", "Dalling", "Landon"] {
        didSet {
            GroupsTableViewController.viewWillAppear(self)
        }
    }
        
    static let shared = NameListController()
    
    // Mark: - Persistence
    
    static func saveNameList() {
        let defaults = UserDefaults.standard
        defaults.set(NameListController.shared.nameList, forKey: "SavedStringArray")
    }
    
    static func retriveNameList() -> [String] {
        let defaults = UserDefaults.standard
        let retrievedNameList = defaults.stringArray(forKey: "SavedStringArray") ?? [String]()
        return retrievedNameList
    }

}
extension Array {
    mutating func shuffle() {
        for _ in indices {
            sort { (_,_) in arc4random() < arc4random() }
        }
    }
}
