//
//  ViewController.swift
//  todolist
//
//  Created by Sean on 19/6/18.
//  Copyright © 2018 Sean. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    var todo: Todo!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = todo.name
        imageView.image = UIImage(named: todo.imageName)
        descriptionLabel.text = todo.description
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm a"
        dateLabel.text = todo.date
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editTodo" {
            let nav = segue.destination as! UINavigationController
            let dest = nav.viewControllers[0] as! AdditionTableViewController
            dest.todo = todo
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

