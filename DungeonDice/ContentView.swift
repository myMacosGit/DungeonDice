//
//  ContentView.swift
//  DungeonDice
//
//  Created by Richard Isaacs on 27.09.22.
//

import SwiftUI

struct ContentView: View {
    
    enum Dice : Int, CaseIterable {
        case four = 4
        case six = 6
        case eight = 8
        case ten = 10
        case twelve = 12
        case twenty = 20
        case hundred = 100
        
        func roll() -> Int {
            return Int.random(in: 1...self.rawValue)
        }
    } // Dice
    
    @State private var resultMessage = ""
    // @State private var players = ["player1","player2","player3","player4","player5"]
    
    
    var body: some View {
        VStack {
            Text("Dungeon Dice")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundColor(.red)
            
            Spacer()
            
            Text(resultMessage)
                .font(.largeTitle)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .frame(height: 150)
            
            Spacer()
            
            ForEach(Dice.allCases, id: \.self) { dice in
                Button("\(dice.rawValue)-sided") {
                    resultMessage = "You rolled a \(dice.roll()) on a \(dice.rawValue)-sided dice"
                }
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
        }
        .padding()
    } // body
} // ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
