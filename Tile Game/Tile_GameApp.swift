//
//  Tile_GameApp.swift
//  Tile Game
//
//  Created by Robbie Duvall on 6/11/23.
//

import SwiftUI
import SwiftData

@main
struct Tile_GameApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView(numberOfSelectedTiles: 0)
        }
        .modelContainer(for: Item.self)
    }
}
