//
//  Set.swift
//  Set
//
//  Created by Jenny Bonsak on 26/02/2019.
//  Copyright © 2019 Jenny Bonsak. All rights reserved.
//

// Pick cards. Check if matching
// Set: Cards disappear, Update score
// Put 3 more cards on table if cards left in deck
import Foundation


class Set {
  var deck = Deck()
  var cardsOnTable = [Card]()
  var numberOfSets: Int


  init() {
    numberOfSets = 0
    for _ in 0..<12 {
      if let card = self.deck.drawCard() {
        self.cardsOnTable.append(card)
      }
    }
  }
    
  /*func getIdentifiers(listOfCards: [Card]) -> [Int]{
    var identifiers = [Int]()
    for card in listOfCards {
      identifiers.append(card.identifier)
    }
    return identifiers
  }*/
}


extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
