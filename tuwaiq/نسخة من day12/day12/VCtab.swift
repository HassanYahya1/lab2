//
//  VCtab.swift
//  day12
//
//  Created by Hassan Yahya on 05/03/1443 AH.
//

import UIKit




struct Users {
    let name: String
    let sub: String
    let coment: String
    let logo : String
}

let usersList = [
    Users (
        name:"Ahmed",
        sub: "hello dad",
        coment: "i will come in Oct 11",
        logo: "AAph"
    ),
    Users (
        name:"Hadi",
        sub: "good morning",
        coment: "i will marry in Aug 11",
        logo: "Hph"
    ),
    Users (
        name:"Ali",
        sub: "hello mom",
        coment: "how are you",
        logo: "AAph"
    ),
    Users (
        name:"Hassan",
        sub: "hello dad",
        coment: "i will come in oct 11",
        logo: "Hph"
    ),
    Users (
        name:"Sara",
        sub: "hello dad",
        coment: "i will come in oct 11",
        logo: "Sph"
    ),
    Users (
        name:"Mohammed",
        sub: "hello dad",
        coment: "i will come in oct 11",
        logo: "Mph"
    )
    
]
class VCtab: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    @IBOutlet weak var myTV: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let user = usersList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "333", for: indexPath
        )as! TableViewCell
        
        cell.userName.text = user.name
        cell.userSub.text = user.sub
        cell.userComent.text = user.coment
        cell.userLogo.image = UIImage (named: user.logo)
        
        return cell
    }
        override func viewDidLoad() {
            super.viewDidLoad()
            
                myTV.delegate = self
                myTV.dataSource = self
        }
    
    
}
class TableViewCell: UITableViewCell{

    @IBOutlet weak var userLogo: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userComent: UILabel!
    @IBOutlet weak var userSub: UILabel!
}
