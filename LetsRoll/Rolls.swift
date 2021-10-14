//
//  Rolls.swift
//  LetsRoll
//
//  Created by Jake King on 06/10/2021.
//

import Foundation

class Roll: Identifiable {
    let id: UUID
    var dice: [Die]
    var values = [Int]()
    var dieSides = 6
    
    init(_ dice: [Die]) {
        self.id = UUID()
        self.dice = dice
    }
    
    func add(_ valueRolled: Int) {
        self.values.append(valueRolled)
    }
    
    func rollScore() -> Int {
        var score = 0
        
        for valueRolled in values {
            score += valueRolled
        }
        
        return score
    }
}

class Rolls: ObservableObject {
    @Published var rolls: [Roll]
    
    init() {
        self.rolls = []
        
        return
    }
    
    func add(_ roll: Roll) {
        self.rolls.append(roll)
        print("\(self.rolls)")
    }
}
