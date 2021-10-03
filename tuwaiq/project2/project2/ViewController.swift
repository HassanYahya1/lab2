//
//  ViewController.swift
//  project2
//
//  Created by Hassan Yahya on 26/02/1443 AH.
//

import UIKit

class ViewContrller: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
          
          
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = view.frame
            gradientLayer.colors = [UIColor.blue.cgColor, UIColor.cyan.cgColor]

            view.layer.addSublayer(gradientLayer)
          }
}
