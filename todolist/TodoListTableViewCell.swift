//
//  TodoListTableViewCell.swift
//  todolist
//
//  Created by Sean on 20/6/18.
//  Copyright © 2018 Sean. All rights reserved.
//

import UIKit

class TodoListTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var imagePreview: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
