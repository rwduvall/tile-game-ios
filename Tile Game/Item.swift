//
//  Item.swift
//  Tile Game
//
//  Created by Robbie Duvall on 6/11/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
