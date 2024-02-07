//
//  ContentView.swift
//  Tile Game
//
//  Created by Robbie Duvall on 6/11/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var selectedTile = LineOption.emptySpace

    var body: some View {
        ScrollView {
//            DragAndDropTest()
            FactoryView(selectedTile: $selectedTile)
            Text("Player 1")
            PlayerBoardView(selectedTile: $selectedTile)
            Spacer(minLength: 30)
            Text("Player 2")
            PlayerBoardView(selectedTile: $selectedTile)
        }
    }
}

#Preview {
    ContentView()
}
