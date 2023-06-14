//
//  PlayerBoardView.swift
//  Tile Game
//
//  Created by Robbie Duvall on 6/13/23.
//

import SwiftUI

struct Lines {
    var rowOne: (String)
    var rowTwo: (tile1Color: String, tile2Color: String)
    var rowThree: (tile1Color: String, tile2Color: String, tile3Color: String)
    
//        rowOne =
}

struct PlayerBoardView: View {
    @Binding var selectedTile: String
//    @State private var tileName: String = "emptySpace"
    @State private var playerLines: Lines = Lines(rowOne: "emptySpace", rowTwo: (tile1Color: "emptySpace", tile2Color: "emptySpace"), rowThree: (tile1Color: "emptySpace", tile2Color: "emptySpace", tile3Color: "emptySpace"))
    

    
    func boardSpace() -> some View {
       return Button(action: {
            }, label: {
                Image(.emptySpace)
                    .resizable()
                    .frame(width: 44, height: 44)
            })
    }
    
    struct wall: View {
        var body: some View {
            Grid {
                GridRow {
                    Image(.blueTile)
                        .resizable()
                        .frame(width: 44, height: 44)
                        .opacity(0.2)
                    Image(.yellowTile)
                        .resizable()
                        .frame(width: 44, height: 44)
                        .opacity(0.2)
                    Image(.redTile)
                        .resizable()
                        .frame(width: 44, height: 44)
                        .opacity(0.2)
                    Image(.blackTile)
                        .resizable()
                        .frame(width: 44, height: 44)
                        .opacity(0.2)
                    Image(.whiteTile)
                        .resizable()
                        .frame(width: 44, height: 44)
                        .opacity(0.2)
                }
                GridRow {
                    Image(.whiteTile)
                        .resizable()
                        .frame(width: 44, height: 44)
                        .opacity(0.2)
                    Image(.blueTile)
                        .resizable()
                        .frame(width: 44, height: 44)
                        .opacity(0.2)
                    Image(.yellowTile)
                        .resizable()
                        .frame(width: 44, height: 44)
                        .opacity(0.2)
                    Image(.redTile)
                        .resizable()
                        .frame(width: 44, height: 44)
                        .opacity(0.2)
                    Image(.blackTile)
                        .resizable()
                        .frame(width: 44, height: 44)
                        .opacity(0.2)
                    
                }
                GridRow {
                    Image(.blackTile)
                        .resizable()
                        .frame(width: 44, height: 44)
                        .opacity(0.2)
                    Image(.whiteTile)
                        .resizable()
                        .frame(width: 44, height: 44)
                        .opacity(0.2)
                    Image(.blueTile)
                        .resizable()
                        .frame(width: 44, height: 44)
                        .opacity(0.2)
                    Image(.yellowTile)
                        .resizable()
                        .frame(width: 44, height: 44)
                        .opacity(0.2)
                    Image(.redTile)
                        .resizable()
                        .frame(width: 44, height: 44)
                        .opacity(0.2)
                }
                GridRow {
                    Image(.redTile)
                        .resizable()
                        .frame(width: 44, height: 44)
                        .opacity(0.2)
                    Image(.blackTile)
                        .resizable()
                        .frame(width: 44, height: 44)
                        .opacity(0.2)
                    Image(.whiteTile)
                        .resizable()
                        .frame(width: 44, height: 44)
                        .opacity(0.2)
                    Image(.blueTile)
                        .resizable()
                        .frame(width: 44, height: 44)
                        .opacity(0.2)
                    Image(.yellowTile)
                        .resizable()
                        .frame(width: 44, height: 44)
                        .opacity(0.2)
                }
                GridRow {
                    Image(.yellowTile)
                        .resizable()
                        .frame(width: 44, height: 44)
                        .opacity(0.2)
                    Image(.redTile)
                        .resizable()
                        .frame(width: 44, height: 44)
                        .opacity(0.2)
                    Image(.blackTile)
                        .resizable()
                        .frame(width: 44, height: 44)
                        .opacity(0.2)
                    Image(.whiteTile)
                        .resizable()
                        .frame(width: 44, height: 44)
                        .opacity(0.2)
                    Image(.blueTile)
                        .resizable()
                        .frame(width: 44, height: 44)
                        .opacity(0.2)

                }
            }
        }
    }

    var body: some View {
        ScrollView(.horizontal) {
            // section where you play tiles
            HStack {
                Grid(alignment: .leading) {
                    GridRow {
                        Button(action: {
                            playerLines.rowOne = selectedTile
                             }, label: {
                                 Image(playerLines.rowOne)
                                     .resizable()
                                     .frame(width: 44, height: 44)
                             })
                    }
                    GridRow {
                        Button(action: {
                            playerLines.rowTwo.tile1Color = selectedTile
                             }, label: {
                                 Image(playerLines.rowTwo.tile1Color)
                                     .resizable()
                                     .frame(width: 44, height: 44)
                             })
                        Button(action: {
                            playerLines.rowTwo.tile2Color = selectedTile
                             }, label: {
                                 Image(playerLines.rowTwo.tile2Color)
                                     .resizable()
                                     .frame(width: 44, height: 44)
                             })
                    }
                    GridRow {
                        Button(action: {
                            playerLines.rowThree.tile1Color = selectedTile
                             }, label: {
                                 Image(playerLines.rowThree.tile1Color)
                                     .resizable()
                                     .frame(width: 44, height: 44)
                             })
                        Button(action: {
                            playerLines.rowThree.tile2Color = selectedTile
                             }, label: {
                                 Image(playerLines.rowThree.tile2Color)
                                     .resizable()
                                     .frame(width: 44, height: 44)
                             })
                        Button(action: {
                            playerLines.rowThree.tile3Color = selectedTile
                             }, label: {
                                 Image(playerLines.rowThree.tile3Color)
                                     .resizable()
                                     .frame(width: 44, height: 44)
                             })
                    }
                    GridRow {
                        boardSpace()
                        boardSpace()
                        boardSpace()
                        boardSpace()
                        
                    }
                    GridRow {
                        boardSpace()
                        boardSpace()
                        boardSpace()
                        boardSpace()
                        boardSpace()
                    }
                }
                wall()
            }
        }
    }
}

#Preview {
    PlayerBoardView(selectedTile: .constant("redTile"))
}
