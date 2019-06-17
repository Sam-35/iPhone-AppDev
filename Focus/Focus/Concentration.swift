//
//  Concentration.swift
//  Focus
//
//  Created by Sam on 6/7/19.
//  Copyright © 2019 WRS. All rights reserved.
//

import Foundation

class Concentration{
    var cards = Array<Card>() //empty array no cards
    var indexOfOneAndOnlyFaceUpCard: Int? //optional, maybe null
    
    //Concentration game logic:
    func chooseCard(at index: Int){
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                //check if cards match:
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }else{
                //either no cards or 2 cards are face up
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false
                    
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
        
    }
    
    init(numberOfPairsOfCards: Int){
        //For loop: for a variable in anything that is a sequence (arrays are obv a seq) from 0 up to
        for identifier in 0..<numberOfPairsOfCards{
            //3 copies are created
            let card = Card()
            //Added twice cuz pair bruv
            cards.append(card)
            cards.append(card)
            
        }
    }
}
