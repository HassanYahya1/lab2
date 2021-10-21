//
//  ViewController.swift
//  day12
//
//  Created by Hassan Yahya on 05/03/1443 AH.
//

import UIKit


var rows = [
    "mic",
    "mic.fill",
    "message",
    "message.fill",
    "sun.min",
    "sun.min.fill",
    "sunset",
    "sunset.fill",
    "pencil",
    "pencil. circle",
    "highlighter",
    "pencil.and.outline",
    "personalhotspot",
]


class ViewController: UIViewController, UITableViewDelegate,
                      UITableViewDataSource {
    
    
    @IBOutlet weak var myTV: UITableView!
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "123", for: indexPath) as! tableViewCell
        
        cell.NameL.text = row
        cell.LogoCell.image = UIImage(systemName: row)
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let row = rows [indexPath.row]
        let AlertController = UIAlertController(
            title: "\(row)",
            message: "w",
            preferredStyle: .alert)
        
    AlertController.addAction(
            UIAlertAction(
                title: "ok",
                style: UIAlertAction.Style.default,
                handler:{ action in
                    print("done")
                    
                })
            
        )
        present(AlertController, animated: true, completion:nil)
    }
    
    
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let deleteAction = UIContextualAction(style: .normal, title:  "Delete", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            
            rows.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
            success(true)
        })
            deleteAction.backgroundColor = .red
            return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            myTV.delegate = self
            myTV.dataSource = self
    }
}
class tableViewCell: UITableViewCell{
    
    
        @IBOutlet weak var NameL: UILabel!
        @IBOutlet weak var LogoCell: UIImageView!
}
