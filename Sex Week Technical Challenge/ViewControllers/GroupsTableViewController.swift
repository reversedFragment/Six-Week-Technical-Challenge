//
//  GroupsTableViewController.swift
//  Sex Week Technical Challenge
//
//  Created by Ben Adams on 6/22/18.
//  Copyright © 2018 Ben Adams. All rights reserved.
//

import UIKit

class GroupsTableViewController: UITableViewController {
    
    /// Mark: - Properties
    
    // TableView Properties
    var sectionNames: Array<String> = {
        var sectionNameTemp: Array<String> = []
        var counter = 0
        for item in NameListController.shared.nameList {
            sectionNameTemp.append("Group: \(counter)")
            counter += 1
        }
        return sectionNameTemp
    }()
    
    @IBAction func addName(_ sender: Any) {
        setupAlertController()
        NameListController.saveNameList()
        tableView.reloadData()
    }
    
    @IBAction func randomizeNameList(_ sender: Any) {
        NameListController.shared.nameList.shuffle()
        NameListController.saveNameList()
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
    


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        if NameListController.shared.nameList.count % 2 != 0 {
            return (NameListController.shared.nameList.count / 2) + 1
        }
        return NameListController.shared.nameList.count / 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (NameListController.shared.nameList.count % 2) == 0 {
            return 2
        } else {
            if section == (tableView.numberOfSections - 1) {
                return 1
            } else {
                return 2
            }
        }
    }
    
    func groupIndex(indexPath: IndexPath) -> Int {
        return (indexPath.section * 2) + (indexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String {
        if (self.sectionNames.count != 0) {
            return (self.sectionNames[section + 1] as? String)!
        }
        return ""
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath)
        
        let name = NameListController.shared.nameList[groupIndex(indexPath: indexPath)]
        cell.textLabel?.text = name
        
        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
            NameListController.shared.nameList.remove(at: indexPath.row)
        }
    }
}


extension GroupsTableViewController {
    func setupAlertController() {
        
        var nameTextField: UITextField?
        
        let alert = UIAlertController(title: "Yo", message: "Enter a Name", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Name..."
            textField.keyboardType = UIKeyboardType.alphabet
            nameTextField = textField
        }
        
        let dismissAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in
            print("Dismiss Button Tapped")
            
        }
        
        let enterNameAction = UIAlertAction(title: "Enter", style: .destructive) { (_) in
            guard let nameText = nameTextField?.text, !nameText.isEmpty else {return}
            NameListController.shared.nameList.append(nameText)
            self.tableView.reloadData()
            
        }
        
        alert.addAction(dismissAction)
        alert.addAction(enterNameAction)
        
        present(alert, animated: true)
    }
}
