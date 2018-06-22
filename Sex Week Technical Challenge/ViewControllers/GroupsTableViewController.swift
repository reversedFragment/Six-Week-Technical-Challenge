//
//  GroupsTableViewController.swift
//  Sex Week Technical Challenge
//
//  Created by Ben Adams on 6/22/18.
//  Copyright © 2018 Ben Adams. All rights reserved.
//

import UIKit

class GroupsTableViewController: UITableViewController {

    
    @IBAction func addName(_ sender: Any) {
    }
    
    @IBAction func randomizeNameList(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NameListController.retriveNameList()
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        if NameListController.shared.nameList.count % 2 != 0 {
            return (NameListController.shared.nameList.count / 2) + 1
        }
        return NameListController.shared.nameList.count / 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath) as? UITableViewCell ?? UITableViewCell()
        let name = NameListController.shared.nameList[indexPath.row]
        cell.textLabel?.text = name

        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
