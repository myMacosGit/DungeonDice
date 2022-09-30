//
//  ContentView.swift
//  DungeonDice
//
//  Created by Richard Isaacs on 27.09.22.
//

import SwiftUI

struct ContentView: View {
    
    
    
    @State private var columns = [
        GridItem(.adaptive(minimum: 100))  ] // not needed
    
    @State private var resultMessage = ""
    // @State private var players = ["player1","player2","player3","player4","player5"]
    
    
    
    var body: some View {
        VStack {
            titleView   // computed property
            
            Spacer()
            
            resultMessageView  // computed property
            
            Spacer()
            
            //buttonLayoutView  // computed property
            ButtonLayout(resultMessage: $resultMessage)
            
        } // VStack
        .padding()
        
    } // body
    
    
} // struct ContentView

extension ContentView {
    private var titleView: some View {
        Text("Dungeon Dice")             // return
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundColor(.red)
    } // titleView
    
    private var resultMessageView: some View {
        Text(resultMessage)
            .font(.largeTitle)
            .fontWeight(.medium)
            .multilineTextAlignment(.center)
            .frame(height: 150)
    } // resultMessageView
    
    
    
} // extension ContentView






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
} // ContentView_Previews
