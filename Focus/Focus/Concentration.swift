//
//  Concentration.swift
//  Focus
//
//  Created by Sam on 6/7/19.
//  Copyright © 2019 WRS. All rights reserved.
//

import Foundation

class Concentration{
    var cards = Array<Card>()
    
    func chooseCard(at index: Int){
        
    }
    
    init(numberOfPairsOfCards: Int){
        //For loop:
        for identifier in 0..<numberOfPairsOfCards{
            let card = Card(identifier: identifier)
            cards.append(card)
            cards.append(card)
            
            
        }
    }
}
