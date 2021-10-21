//
//  Data.swift
//  jahez.2
//
//  Created by Hassan Yahya on 04/03/1443 AH.
//

import UIKit

struct Rest {
    let name: String
    let type: String
    let state: String
    let rating: Int
    let logo: String
    let foods: Array<food>
    
}

struct food {
    let name: String
    let image: String
    let price: Double
}

let restList = [
    Rest(
        name: "الرومانسيه",
        type: "رز",
        state: "مفتوح",
        rating: 6,
        logo: "الرومانسيه",
        foods: [
            food(
                name: "مندي لحم",
                image: "لحم الرومانسيه",
                price: 66.5
            )
        
        ]
    ),
    Rest(
        name: "سينشري برقر",
        type: "برقر",
         state: "مغلق",
         rating: 5,
         logo: "لوقو سينشري",
         foods: [
            food(
                name: "برقر لحم",
                image: "سينشري برقر",
                price: 36.66
            )
        
        ]
    ),
    Rest(
        name: "المشوي العنابي",
        type: "مشويات",
        state: "مفتوح",
        rating: 5 ,
        logo: "المشوي العنابي",
        foods:  [
            food(
                name: "كباب لحم",
                image: "كباب العنابي",
                price: 50
            )
        
        ]
    )
]
