//
//  RollView.swift
//  LetsRoll
//
//  Created by Jake King on 06/10/2021.
//

import SwiftUI

struct RollView: View {
    @EnvironmentObject var rolls: Rolls

    let diceToRoll: [Die]
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading) {
                    Text("Use the settings icon (\(Image(systemName: "gearshape"))) to select the number of sides and dice.")
                    Text("When you're ready, hit the Roll! button.")
                    Text("Go to Roll History to view all your previous rolls.")
                        .padding(.bottom,
                                 250)
                }
                .fixedSize(horizontal: false,
                           vertical: true)
                .padding([.leading, .trailing],
                         15)
                                
                VStack {
                    HStack {
                        ForEach(diceToRoll,
                                id: \.id) { die in
                            DieView(valueRolled: die.valueRolled)
                        }
                    }
                                
                    Button(action: {
                        rollDice(diceToRoll)
                    }) {
                        Text("Roll!")
                            .padding([.top,
                                      .bottom])
                            .frame(width: 175)
                    }
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                    .padding()
                }
                .padding(.bottom,
                125)
            }
            .onAppear {
                print("\(diceToRoll.count)")
            }
        }
        .navigationBarTitle("Let's Roll!")
    }
    
    func rollDice(_ dice: [Die]) {
        let newRoll = Roll(dice)

        for die in newRoll.dice {
            die.rollDie()
            newRoll.add(die.valueRolled)
            newRoll.dieSides = die.sides
            
            print("Value rolled on dice \(die.id): \(die.valueRolled)")
        }
        
        print("Values rolled on all dice: \(newRoll.values)")
        print("Total value of values rolled: \(newRoll.rollScore())")
        
        self.rolls.add(newRoll)
    }
}

struct RollView_Previews: PreviewProvider {
    static var previews: some View {
        RollView(diceToRoll: [Die(sides: 6)])
    }
}
