//
//  SettingsView.swift
//  LetsRoll
//
//  Created by Jake King on 08/10/2021.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var dieCount: Int
    @Binding var sides: Int
    @Binding var diceToRoll: [Die]
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
        setDice()
    }
    
    func setDice() {
        diceToRoll.removeAll()
        
        for _ in 0..<dieCount {
            diceToRoll.append(Die(sides: sides))
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Stepper("Number of sides: \(sides)",
                        value: $sides,
                        in: 4 ... 12,
                        step: 1)
                    .padding()
                                
                Stepper("Number of dice: \(dieCount)",
                        value: $dieCount,
                        in: 1 ... 3,
                        step: 1)
                    .padding()
                
                Spacer()
            }
            .navigationBarTitle("Settings")
            .navigationBarItems(trailing: Button("Done",
                                                 action: dismiss))
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(dieCount: .constant(3),
                     sides: .constant(6),
                     diceToRoll: .constant([Die(sides: 6)]))
    }
}
