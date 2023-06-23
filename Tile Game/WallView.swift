//
//  WallView.swift
//  Tile Game
//
//  Created by Robbie Duvall on 6/20/23.
//

import SwiftUI

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
                        .animation(.bouncy, value: space.color)
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
