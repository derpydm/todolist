//
//  TodoListTableViewController.swift
//  todolist
//
//  Created by Sean on 20/6/18.
//  Copyright © 2018 Sean. All rights reserved.
//

import UIKit

class TodoListTableViewController: UITableViewController {
    var todos: [Todo]!
    var todo: Todo!
    override func viewDidLoad() {
        super.viewDidLoad()
        todos = Todo.loadFromFile()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showTodo", sender: Any.self)
    }
    @IBAction func unwindToTodoList(with segue: UIStoryboardSegue) {
        if segue.identifier == "addWindingSegue" {
            let source = segue.source as! AdditionTableViewController
            if tableView.indexPathForSelectedRow == nil {
                todos.append(source.todo)
                tableView.reloadData()
                Todo.saveToFile(todos: todos)
            } else {
                tableView.reloadData()
                Todo.saveToFile(todos: todos)
            }
        }
        
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"todoCell", for: indexPath) as! TodoListTableViewCell
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm a"
        cell.dateLabel.text = todos[indexPath.row].date
        cell.nameLabel.text = todos[indexPath.row].name
        cell.imagePreview.image = UIImage(named: todos[indexPath.row].imageName)
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .right)
            Todo.saveToFile(todos: todos)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let todo = todos.remove(at: sourceIndexPath.row)
        todos.insert(todo,at: destinationIndexPath.row)
        Todo.saveToFile(todos: todos)
        tableView.reloadData()
    }

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
        if segue.identifier == "showTodo" {
            let dest = segue.destination as! DetailsViewController
            if let indexPath = tableView.indexPathForSelectedRow {
                dest.todo = todos[indexPath.row]
            }
        }
        
    }


}
