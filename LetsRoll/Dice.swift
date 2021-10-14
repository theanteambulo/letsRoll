//
//  Dice.swift
//  LetsRoll
//
//  Created by Jake King on 06/10/2021.
//

import Foundation

class Die: Identifiable {
    let id: UUID

    var sides: Int
    
    var possibleValues: [Int] {
        return Array(1...sides)
    }
    
    var valueRolled: Int

    static var example: Die {
        Die(sides: 6)
    }
    
    init(sides: Int) {
        self.id = UUID()
        self.sides = sides
        self.valueRolled = 4
    }
    
    func rollDie() {
        self.valueRolled = self.possibleValues.randomElement() ?? 4
    }
}
