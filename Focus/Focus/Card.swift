//
//  Card.swift
//  Focus
//
//  Created by Sam on 6/7/19.
//  Copyright © 2019 WRS. All rights reserved.
//

import Foundation

struct Card{
    var isFaceUp = false;
    var isMatched = false;
    var identifier: Int
    
    init(identifier  : Int){
        self.identifier = identifier
    }
    
}
