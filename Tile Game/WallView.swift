//
//  WallView.swift
//  Tile Game
//
//  Created by Robbie Duvall on 6/20/23.
//

import SwiftUI

struct WallView: View {
    @Binding var wall: WallModel
    
    var body: some View {
        Grid {
            GridRow {
                ForEach(wall.rowOne, id: \.color) { space in
                    TileView(space.color)
                        .opacity(space.occupied ? 1 : 0.2)
                        .animation(.bouncy, value: space.color)
                }
            }
            GridRow {
                ForEach(wall.rowTwo, id: \.color) { space in
                    TileView(space.color)
                        .opacity(space.occupied ? 1 : 0.2)
                }
            }
            GridRow {
                ForEach(wall.rowThree, id: \.color) { space in
                    TileView(space.color)
                        .opacity(space.occupied ? 1 : 0.2)
                }
            }
            GridRow {
                ForEach(wall.rowFour, id: \.color) { space in
                    TileView(space.color)
                        .opacity(space.occupied ? 1 : 0.2)
                }
            }
            GridRow {
                ForEach(wall.rowFive, id: \.color) { space in
                    TileView(space.color)
                        .opacity(space.occupied ? 1 : 0.2)
                }
            }
        }
    }
}

#Preview {
    WallView(wall: .constant(WallModel()))
}
