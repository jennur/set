//
//  Deck.swift
//  Set
//
//  Created by Jenny Bonsak on 02/03/2019.
//  Copyright © 2019 Jenny Bonsak. All rights reserved.
//

import Foundation

class Deck {
  var cards = [Card]()
  var accessibleIdentifiers = Array(0...23)


  init() {
    for number in Card.Number.all {
      for shape in Card.Shape.all {
        for fill in Card.Fill.all {
          for color in Card.Color.all {
            cards.append(Card(number: number, shape: shape, fill: fill, color: color))
          }
        }
      }
    }
  }
    
  func getUniqueIdentifier() -> Int {
    
    let identifierIndex = self.accessibleIdentifiers.count.arc4random
    return self.accessibleIdentifiers.remove(at: identifierIndex)
  }
    
  func drawCard() -> Card? {
    if self.cards.count > 0 {
      let randomIndex = self.cards.count.arc4random
      
      var card = self.cards.remove(at: randomIndex)
      card.identifier = getUniqueIdentifier()
      print("************************")
      print("************************")
      print("Drawn card: ", card.identifier)
        print("Accessible identifiers: ", self.accessibleIdentifiers)
        print("Cards left in deck: ", self.cards.count)
      return card
    } else {
      return nil
    }
  }
}
