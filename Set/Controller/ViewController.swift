//
//  ViewController.swift
//  Set
//
//  Created by Jenny Bonsak on 26/02/2019.
//  Copyright © 2019 Jenny Bonsak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
  var game = Set()
  @IBOutlet var cardButtons: [UIButton]! {
    didSet {
      for button in cardButtons {
        button.layer.cornerRadius = 5
      }
    }
  }
  var selectedCards = [Card]()
    
  @IBOutlet weak var cardsInDeck: UILabel! {
    didSet {
      cardsInDeck.text = "Cards left in deck: \(game.deck.cards.count)"
    }
  }
    
  override func viewDidLoad() {
    super.viewDidLoad()
    updateView()
  }
    
  @IBAction func clickButton(_ sender: UIButton) {
    
    let index = cardButtons.index(of: sender)!
    print("clicked index: ", index)
    
    if selectedCards.count <= 3 {
      for card in game.cardsOnTable {
        if index == card.identifier { // check if card is selected:
            
            if selectedCards.contains(card) {
              let selectedCardIndex = selectedCards.index(of: card)
              selectedCards.remove(at: selectedCardIndex!)
            }
            else { // if card is not selected
              if selectedCards.count < 3 { // and number of selected cards < 3
                selectedCards.append(card)
              }
              else { // if num of selected cards == 3
                // checkIfSet() ? addSet() : selectedCards.removeAll()
                checkIfSet()
                selectedCards.removeAll()
                selectedCards.append(card)
              }
            }
          break // if correct index found
        }
      }
    }
        
/*
    if selectedCards.count == 3 && !alreadySelectedCard/* && !checkIfSet()*/{
        selectedCards.removeAll()
    } else if selectedCards.count == 3/* && checkIfSet() */{
        game.numberOfSets += 1
    /*
         for card in game.cardsOnTable {
         if matchedIdentifiers.contains(card.identifier) {
         cardsOnTable.remove(at: cardsOnTable.indexOf(card))
         }
         }
    */
*/
    updateView()
  }
    
  @IBAction func newGameBtn(_ sender: UIButton) {
    selectedCards.removeAll()
    game = Set()
    updateView()
  }

  @IBAction func dealCardsBtn(_ sender: UIButton) {
    for _ in 1...3 {
      if game.cardsOnTable.count < 24 {
        if let card = game.deck.drawCard() {
          game.cardsOnTable.append(card)
          updateView()
        }
      }
    }
  }
    
/***********************************************
 ************ FUNCTION DECLARATIONS ************
 ***********************************************/
    
  func updateView() {
    for card in cardButtons {
      card.alpha = 0
    }
    for card in game.cardsOnTable {
      let index = card.identifier
      cardButtons[index].alpha = 1
      cardButtons[index].backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    appendShapesToCards()
    //print(cardButtons.indices)
    for card in selectedCards {
      cardButtons[card.identifier].backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    }
  }

  func appendShapesToCards() {
    var number: Int = 0
    var shape: String = ""
    var fill: CGFloat = 0.0
    var color: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    
    for card in game.cardsOnTable {
      let index = card.identifier
        
      switch card.number {
      case .one:
        number = 1
      case .two:
        number = 2
      case .three:
        number = 3
      }
        
      switch card.shape {
      case .square:
        shape = "■"
      case .circle:
        shape = "●"
      case .triangle:
        shape = "▲"
      }
        
      switch card.fill {
      case .transparent:
        fill = 0.0
      case .filled:
        fill = 1.0
      case .shading:
        fill = 0.5
      }
        
      switch card.color {
      case .blue:
        color = #colorLiteral(red: 0, green: 0.04422783852, blue: 1, alpha: 1)
      case .purple:
        color = #colorLiteral(red: 0.6806814075, green: 0, blue: 1, alpha: 1)
      case .red:
        color = #colorLiteral(red: 1, green: 0, blue: 0.3369487524, alpha: 1)
      }
    
      var shapeString: String = ""
      for _ in 0..<number {
        shapeString += shape
      }
      let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: color.withAlphaComponent(fill),
                        .strokeWidth: -7,
                        .strokeColor: color,
                        .font: UIFont(name: "System Font", size: 25)!]
      let shapes = NSAttributedString(string: shapeString, attributes: attributes)
      cardButtons[index].setAttributedTitle(shapes, for: .normal)
    }
  }
  func checkIfSet() -> Bool {
    var set = false
    var match = false
    
    var properties = [Any]()
    var counts: [String: Int] = [:]
    
    for card in selectedCards {
        properties.append(card.number)
        properties.append(card.shape)
        properties.append(card.fill)
        properties.append(card.color)
    }
    print(properties)
    
    return set
    
  }

  func addSet() {
    
  }
}

