//
//  ContentView.swift
//  Tile Game
//
//  Created by Robbie Duvall on 6/11/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    @State private var selectedTile = LineOptions.emptySpace
    @State var numberOfSelectedTiles: Int

    var body: some View {
        ScrollView {
            FactoryView(selectedTile: $selectedTile, numberOfSelectedTiles: $numberOfSelectedTiles)
            Text("Player 1")
            PlayerBoardView(selectedTile: $selectedTile, numberOfPlacedTiles: $numberOfSelectedTiles)
            Spacer(minLength: 30)
            Text("Player 2")
            PlayerBoardView(selectedTile: $selectedTile, numberOfPlacedTiles: $numberOfSelectedTiles)
        }
    }
}

#Preview {
    ContentView(numberOfSelectedTiles: 2)
}
