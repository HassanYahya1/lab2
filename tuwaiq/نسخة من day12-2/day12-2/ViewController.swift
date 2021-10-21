//
//  ViewController.swift
//  day12-2
//
//  Created by Hassan Yahya on 05/03/1443 AH.
//

import UIKit
private
var names = [
    "Hassan",
    "Ali",
    "Sara",
    "Hadi",
    "Yahya"
]

class TVN: UIViewController, UITableViewDelegate,
           UITableViewDataSource {
   
    @IBOutlet weak var myTV: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let name = names[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath) as! tableviewcell
        cell.LCell.text = name
        
        if indexPath.row % 2 == 0{
            cell.LCell.backgroundColor = UIColor.blue
        }
        else{
            cell.LCell.backgroundColor = UIColor.gray
        }
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            myTV.delegate = self
            myTV.dataSource = self
    }
}
class tableviewcell: UITableViewCell {
    @IBOutlet weak var LCell: UILabel!
    
}
