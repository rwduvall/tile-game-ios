//
//  LineModel.swift
//  Tile Game
//
//  Created by Robbie Duvall on 2/8/24.
//

import SwiftUI
import Foundation
import UniformTypeIdentifiers

enum LineOption: String, Equatable, Codable {
    case emptySpace = "emptySpace"
    case blue = "blueTile"
    case black = "blackTile"
    case red = "redTile"
    case white = "whiteTile"
    case yellow = "yellowTile"
}

struct DraggableTile: Codable, Transferable {
    let id: UUID
    let color: LineOption
    let factoryName: String
    let index: Int
    
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .html)
    }
}

extension UTType {
    static let draggableTile = UTType(exportedAs: "com.Tile-Game.draggable-tile")
}

struct Line {
    var numOfSpaces: Int
    var numOfOccupiedSpaces: Int
    var color: LineOption
    
    func numberOfEmptySpaces() -> Int {
        return numOfSpaces - numOfOccupiedSpaces
    }
}

struct Lines {
    var rowOne: Line
    var rowTwo: Line
    var rowThree: Line
    var rowFour: Line
    var rowFive: Line
}
