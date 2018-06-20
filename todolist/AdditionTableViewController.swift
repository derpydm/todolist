//
//  AdditionTableViewController.swift
//  todolist
//
//  Created by Sean on 20/6/18.
//  Copyright © 2018 Sean. All rights reserved.
//

import UIKit

class AdditionTableViewController: UITableViewController {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var descField: UITextField!
    @IBOutlet weak var imageNameField: UITextField!
    var todo: Todo!
    @IBOutlet weak var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        if todo != nil {
            nameField.text = todo.name
            descField.text = todo.description
            imageNameField.text = todo.imageName
            dateFormatter.dateFormat = "dd/MM/yyyy HH:mm a"
            datePicker.date = dateFormatter.date(from: todo.date)!
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addWindingSegue" {
        let name = nameField.text ?? ""
        let desc = descField.text ?? ""
        let imageName = imageNameField.text ?? ""
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm a"
        let time = datePicker.date
        if todo == nil {
            todo = Todo(name: name, description: desc, date: dateFormatter.string(from: time), imageName: imageName)
        } else {
            todo.name = name
            todo.description = desc
            todo.date = dateFormatter.string(from: time)
            todo.imageName = imageName
        }
        }
    }

}
