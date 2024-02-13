//
//  ContentView.swift
//  Tile Game
//
//  Created by Robbie Duvall on 6/11/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State var factories: Factories
    
    init() {
        func randomTile() -> LineOption {
            let colors: [LineOption] = [.blue, .yellow, .red, .black, .white]
            let randomIndex = Int.random(in: 0..<colors.count)
            return colors[randomIndex]
        }
        
        /* static factories to make testing/debugging easier
         self.factories = Factories(
         factory1: [.yellow, .yellow, .black, .white],
         factory2: [.white, .red, .black, .black],
         factory3: [.red, .red, .yellow, .black],
         factory4: [.blue, .white, .black, .red]
         )
         */
        
        self.factories = Factories(
            factory1: [randomTile(), randomTile(), randomTile(), randomTile()],
            factory2: [randomTile(), randomTile(), randomTile(), randomTile()],
            factory3: [randomTile(), randomTile(), randomTile(), randomTile()],
            factory4: [randomTile(), randomTile(), randomTile(), randomTile()]
        )
    }

    var body: some View {
        ScrollView {
            FactoryView(factories: $factories)
            Text("Player 1")
            PlayerBoardView(factories: $factories)
            Spacer(minLength: 30)
            Text("Player 2")
            PlayerBoardView(factories: $factories)
        }
    }
}

#Preview {
    ContentView()
}
