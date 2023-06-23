//
//  WallViewModel.swift
//  Tile Game
//
//  Created by Robbie Duvall on 6/21/23.
//

import Foundation

struct WallModel {
        var rowOne = [
            Space(occupied: false, color: .blue),
            Space(occupied: false, color: .yellow),
            Space(occupied: false, color: .red),
            Space(occupied: false, color: .black),
            Space(occupied: false, color: .white)
        ]
        
        var rowTwo = [
            Space(occupied: false, color: .white),
            Space(occupied: false, color: .blue),
            Space(occupied: false, color: .yellow),
            Space(occupied: false, color: .red),
            Space(occupied: false, color: .black),
        ]
        
        var rowThree = [
            Space(occupied: false, color: .black),
            Space(occupied: false, color: .white),
            Space(occupied: false, color: .blue),
            Space(occupied: false, color: .yellow),
            Space(occupied: false, color: .red)
        ]
        
        var rowFour = [
            Space(occupied: false, color: .red),
            Space(occupied: false, color: .black),
            Space(occupied: false, color: .white),
            Space(occupied: false, color: .blue),
            Space(occupied: false, color: .yellow)
        ]
        
        var rowFive = [
            Space(occupied: false, color: .yellow),
            Space(occupied: false, color: .red),
            Space(occupied: false, color: .black),
            Space(occupied: false, color: .white),
            Space(occupied: false, color: .blue)
        ]
    
    struct Space {
        var occupied: Bool
        var color: WallColor
    }
    
    enum WallColor: String {
        case blue = "blueTile"
        case black = "blackTile"
        case red = "redTile"
        case white = "whiteTile"
        case yellow = "yellowTile"
    }
}
