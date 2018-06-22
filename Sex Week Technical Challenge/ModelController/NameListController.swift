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
    
    var nameList = [String]()
    var shuffledList = Array<Any>()
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

//    static func nameStepper() -> [[String]]? {
//        var counter = 0
//        for item in stride(from: 1,
//                           through: NameListController.nameList.count,
//                           by: 2) {
//            var pair = (NameListController.nameList[counter],
//                        NameListController.nameList[counter+1)
//            NameListController.nameList.append(pair)
//            counter = counter + 2
//        }
//        NameListController.nameList.removeAll()
//    }

}
extension Array {
    mutating func shuffle() {
        for _ in indices {
            sort { (_,_) in arc4random() < arc4random() }
        }
    }
}
