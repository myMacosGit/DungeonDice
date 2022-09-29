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
    
    @State private var columns = [
        GridItem(.adaptive(minimum: 100))  ] // not needed
    
    @State private var resultMessage = ""
    // @State private var players = ["player1","player2","player3","player4","player5"]
    
    @State private var buttonsLeftOver = 0 // buttons in full row
    
    let horizontalPadding: CGFloat = 16
    let spacing: CGFloat = 0  // between buttons
    let buttonWidth: CGFloat = 102 // 130
    
    var body: some View {
        GeometryReader { geo in
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
                
                LazyVGrid(columns:[GridItem(.adaptive(minimum: buttonWidth),spacing: spacing   )  ]) {
                    ///LazyVGrid(columns: columns) {
                    ForEach(Dice.allCases.dropLast(buttonsLeftOver), id: \.self) { dice in
                        Button("\(dice.rawValue)-sided") {
                            resultMessage = "You rolled a \(dice.roll()) on a \(dice.rawValue)-sided dice"
                        }
                        .frame(width: buttonWidth)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                }
                
                HStack {
                    ForEach(Dice.allCases.suffix(buttonsLeftOver), id: \.self) { dice in
                        Button("\(dice.rawValue)-sided") {
                            resultMessage = "You rolled a \(dice.roll()) on a \(dice.rawValue)-sided dice"
                        }
                        .frame(width: buttonWidth)
                        
                        .buttonStyle(.borderedProminent)
                        .tint(.red)
                    }
                } // HStack
                
            } // VStack
            .padding()
            .onChange(of: geo.size.width, perform: { newValue in
                
                
//                var screenWidth = geo.size.width - horizontalPadding * 2 // padding on both sides
//                if Dice.allCases.count > 1 {
//                    screenWidth += spacing
//                }
//
//                // caluulate numOfButtonsPerRow as a Int
//                let numOfButtonsPerRow = Int(screenWidth) / Int(buttonWidth + spacing)
//                buttonsLeftOver = Dice.allCases.count % numOfButtonsPerRow
//
//                print("numOfButtonsPerRow = \(numOfButtonsPerRow)")
//                print("buttonsLeftOver = \(buttonsLeftOver)")
                
                arrangeGridItems(geo: geo)
                
                
            }) // onChange
            .onAppear {
//                var screenWidth = geo.size.width - horizontalPadding * 2 // padding on both sides
//                if Dice.allCases.count > 1 {
//                    screenWidth += spacing
//                }
//
//                // caluulate numOfButtonsPerRow as a Int
//                let numOfButtonsPerRow = Int(screenWidth) / Int(buttonWidth + spacing)
//                buttonsLeftOver = Dice.allCases.count % numOfButtonsPerRow
//
//                print("numOfButtonsPerRow = \(numOfButtonsPerRow)")
//                print("buttonsLeftOver = \(buttonsLeftOver)")
                
                arrangeGridItems(geo: geo)
                
            } // onAppear
        } // geo
        
    } // body
    
    
    
    func arrangeGridItems(geo: GeometryProxy) {
        var screenWidth =  geo.size.width - horizontalPadding * 2 // padding on both sides
                if Dice.allCases.count > 1 {
                    screenWidth += spacing
                }
                
                // caluulate numOfButtonsPerRow as a Int
                let numOfButtonsPerRow = Int(screenWidth) / Int(buttonWidth + spacing)
                buttonsLeftOver = Dice.allCases.count % numOfButtonsPerRow
                
                print("numOfButtonsPerRow = \(numOfButtonsPerRow)")
                print("buttonsLeftOver = \(buttonsLeftOver)")

            }

    
    
    
} // struct ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
