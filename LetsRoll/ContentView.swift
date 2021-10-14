//
//  ContentView.swift
//  LetsRoll
//
//  Created by Jake King on 06/10/2021.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var dieCount = 1
    @State private var sides = 6
    @State private var displaySettingsSheet = false
    @State private var diceToRoll = [Die.example]
    
    var rolls = Rolls()

    var body: some View {
        TabView {
            NavigationView {
                RollView(diceToRoll: diceToRoll)
                    .navigationBarItems(trailing: Button(action: {
                        self.displaySettingsSheet.toggle()
                    }) {
                        Image(systemName: "gearshape")
                    })
            }
            .sheet(isPresented: $displaySettingsSheet,
                   onDismiss: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                SettingsView(dieCount: self.$dieCount,
                             sides: self.$sides,
                             diceToRoll: self.$diceToRoll)
            }
            .tabItem {
                Image(systemName: "gamecontroller")
                Text("Play")
            }
            
            RollHistoryView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("History")
                }
        }
        .environmentObject(rolls)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
