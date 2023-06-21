//
//  WallView.swift
//  Tile Game
//
//  Created by Robbie Duvall on 6/20/23.
//

import SwiftUI

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

struct WallView: View {
    @Binding var spaceOccupied: Bool
    @Binding var wall: WallModel
    
    var body: some View {
        Grid {
            GridRow {
                ForEach(wall.rowOne, id: \.color) { space in
                    Image(space.color.rawValue)
                        .resizable()
                        .frame(width: 44, height: 44)
                        .opacity(space.occupied ? 1 : 0.2)
                }
            }
            GridRow {
                ForEach(wall.rowTwo, id: \.color) { space in
                    Image(space.color.rawValue)
                        .resizable()
                        .frame(width: 44, height: 44)
                        .opacity(space.occupied ? 1 : 0.2)
                }
            }
            GridRow {
                ForEach(wall.rowThree, id: \.color) { space in
                    Image(space.color.rawValue)
                        .resizable()
                        .frame(width: 44, height: 44)
                        .opacity(space.occupied ? 1 : 0.2)
                }
            }
            GridRow {
                ForEach(wall.rowFour, id: \.color) { space in
                    Image(space.color.rawValue)
                        .resizable()
                        .frame(width: 44, height: 44)
                        .opacity(space.occupied ? 1 : 0.2)
                }
            }
            GridRow {
                ForEach(wall.rowFive, id: \.color) { space in
                    Image(space.color.rawValue)
                        .resizable()
                        .frame(width: 44, height: 44)
                        .opacity(space.occupied ? 1 : 0.2)
                }
            }
        }
    }
}

#Preview {
    WallView(spaceOccupied: .constant(true), wall: .constant(WallModel()))
}
