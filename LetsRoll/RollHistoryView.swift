//
//  RollHistoryView.swift
//  LetsRoll
//
//  Created by Jake King on 06/10/2021.
//

import SwiftUI

struct RollHistoryView: View {
    @EnvironmentObject var rolls: Rolls
    
    var rollsArray: [Roll] {
        rolls.rolls
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if rollsArray.count > 0 {
                    List {
                        ForEach(rollsArray,
                                id: \.id) { roll in
                            HStack {
                                VStack {
                                    Image(systemName: "\(roll.rollScore()).circle.fill")
                                        .font(.title)
                                }
                                
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text("Values:")
                                        
                                        ForEach(roll.values,
                                            id: \.self) { value in
                                                Text("\(value)")
                                                    .font(.headline)
                                        }
                                    }
                                    
                                    Text("\(roll.dice.count) \(roll.dice.count == 1 ? "die" : "dice") (\(roll.dieSides)-sided)")
                                        .foregroundColor(.secondary)
                                }
                                .padding(.leading,
                                         5)
                                
                                Spacer()
                                
                                VStack {
                                    Text("Roll Count: \(rollsArray.firstIndex(where: { $0.id == roll.id })! + 1)")
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                    }
                } else {
                    Text("No rolls yet!")
                }
            }
            .navigationBarTitle("Roll History")
        }
    }
}

struct RollHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        RollHistoryView()
    }
}
