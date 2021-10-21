//
//  ViewController.swift
//  week3 pro
//
//  Created by Hassan Yahya on 07/03/1443 AH.
//
//
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var todoTableView: UITableView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        todoTableView.delegate = self
        todoTableView.dataSource = self
        todoTableView.rowHeight = 80
    }
    
    @IBAction func addTodo(_ sender: Any) {
        
    let todoAlert = UIAlertController(title: "Add Todo", message: "Add a new todo", preferredStyle: .alert)
        
        todoAlert.addTextField()
        
        let addTodoAction = UIAlertAction(title: "Add", style: .default) { (action) in
            let newTodo = todoAlert.textFields![0]
            taskArray.append(Task(taskTitle: newTodo.text, isCompleted: false))
            self.todoTableView.reloadData()
        }
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        
        todoAlert.addAction(addTodoAction)
        todoAlert.addAction(cancelAction)
        
        present(todoAlert, animated: true, completion: nil)
        
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! TodoCell
        let task = taskArray[indexPath.row]
        cell.todoTF.text = task.taskTitle
        cell.indexpath = indexPath
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! TodoCell
        
        if cell.isChecked == false {
            cell.checkmarkImage.image = UIImage(named: "checkmark.png")
            cell.isChecked = true
        }
        else {
            cell.checkmarkImage.image = nil
            cell.isChecked = false
        }
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            taskArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            todoTableView.reloadData()
        }
    }

}

