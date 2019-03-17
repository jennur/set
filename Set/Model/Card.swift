//
//  Card.swift
//  Set
//
//  Created by Jenny Bonsak on 27/02/2019.
//  Copyright © 2019 Jenny Bonsak. All rights reserved.
//

import Foundation

struct Card: Equatable {
    
    init(number: Card.Number, shape: Card.Shape, fill: Card.Fill, color: Card.Color){
        
        self.number = number
        self.shape = shape
        self.fill = fill
        self.color = color

        self.isMatched = false
        self.isSelected = false
        self.identifier = 0
    }

    var number: Number
    var shape: Shape
    var fill: Fill
    var color: Color
    var identifier: Int
    
    
    var isMatched: Bool
    var isSelected: Bool
    
    private static var initIndex = 0
    
    private static func produceIndex() -> Int {
      Card.initIndex += 1
      return Card.initIndex
    }
    
    
    enum Number {
        case one
        case two
        case three
        
        static var all = [Number.one, .two, .three]
    }
    
    enum Shape {
        case square
        case circle
        case triangle
        
        static var all = [Shape.square, .circle, .triangle]
    }
    
    enum Fill {
        case transparent
        case filled
        case shading
        
        static var all = [Fill.transparent, .filled, .shading]
    }
    
    enum Color{
        case blue
        case purple
        case red
        
        static var all = [Color.blue, .purple, .red]

    }
}

