//
//  todo.swift
//  week3 pro
//
//  Created by Hassan Yahya on 07/03/1443 AH.
//

import UIKit

protocol checkButtonDelegate {
    func checkTapped(at indx: IndexPath)
}

struct Task {
    var taskTitle: String?
    var isCompleted = false
}
   var taskArray = [Task] ()

class TodoCell: UITableViewCell, UITextFieldDelegate {

    var delegate: checkButtonDelegate!
    var indexpath: IndexPath!
    
    @IBOutlet weak var todoTF: UITextField!
    @IBOutlet weak var checkmarkImage: UIImageView!
    
    var isChecked = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        todoTF.delegate = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let update = Task(taskTitle: todoTF.text, isCompleted: taskArray[indexpath.row].isCompleted)
        
        taskArray[indexpath.row] = update
        todoTF.resignFirstResponder()
        return true
    }
}

