//
//  PlayerBoardView.swift
//  Tile Game
//
//  Created by Robbie Duvall on 6/13/23.
//

import SwiftUI

enum LineOptions: String {
    case emptySpace = "emptySpace"
    case blue = "blueTile"
    case black = "blackTile"
    case red = "redTile"
    case white = "whiteTile"
    case yellow = "yellowTile"
}

struct Lines {
    var rowOne: (LineOptions)
    var rowTwo: (tile1Color: LineOptions, tile2Color: LineOptions)
    var rowThree: (tile1Color: LineOptions, tile2Color: LineOptions, tile3Color: LineOptions)
    var rowFour: (tile1Color: LineOptions, tile2Color: LineOptions, tile3Color: LineOptions, tile4Color: LineOptions)
    var rowFive: (tile1Color: LineOptions, tile2Color: LineOptions, tile3Color: LineOptions, tile4Color: LineOptions, tile5Color: LineOptions)
    
}

struct PlayerBoardView: View {
    @Binding var selectedTile: LineOptions
    @State private var playerLines: Lines = Lines(
        rowOne: .emptySpace,
        rowTwo: (tile1Color: .emptySpace, tile2Color: .emptySpace),
        rowThree: (tile1Color: .emptySpace, tile2Color: .emptySpace, tile3Color: .emptySpace),
        rowFour: (tile1Color: .emptySpace, tile2Color: .emptySpace, tile3Color: .emptySpace, tile4Color: .emptySpace),
        rowFive: (tile1Color: .emptySpace, tile2Color: .emptySpace, tile3Color: .emptySpace, tile4Color: .emptySpace, tile5Color: .emptySpace)
    )
    @State private var wall = WallModel()
    @State private var occupied = false
    
    func boardSpace() -> some View {
        return Button(action: {
        }, label: {
            Image(.emptySpace)
                .resizable()
                .frame(width: 44, height: 44)
        })
    }
    
    func endRound() -> some View {
        Button(action: {

            switch playerLines.rowOne {
            case .blue:
                wall.rowOne[0].occupied = true
            case .yellow:
                wall.rowOne[1].occupied = true
            case .red:
                wall.rowOne[2].occupied = true
            case .black:
                wall.rowOne[3].occupied = true
            case .white:
                wall.rowOne[4].occupied = true
            case .emptySpace:
                break
            }
            // safe to set to empty since this is line 1
            playerLines.rowOne = .emptySpace
            
            if (playerLines.rowTwo.tile1Color == playerLines.rowTwo.tile2Color) {
                switch playerLines.rowTwo.tile1Color {
                case .white:
                    wall.rowTwo[0].occupied = true
                case .blue:
                    wall.rowTwo[1].occupied = true
                case .yellow:
                    wall.rowTwo[2].occupied = true
                case .red:
                    wall.rowTwo[3].occupied = true
                case .black:
                    wall.rowTwo[4].occupied = true
                case .emptySpace:
                    break
                }
                playerLines.rowTwo.tile1Color = .emptySpace
                playerLines.rowTwo.tile2Color = .emptySpace
            }
            // TODO: the rest of the rows

        }, label: {
            Text("end round")
        })
    }
    
    var body: some View {
        ScrollView(.horizontal) {
            endRound()
            // section where you play tiles
            HStack {
                Grid(alignment: .leading) {
                    GridRow {
                        // Spacer to push the content the right
                        ForEach(1..<5) { i in
                            Spacer().gridCellUnsizedAxes([.horizontal, .vertical])
                        }
                        
                        Button(action: {
                            playerLines.rowOne = selectedTile
                        }, label: {
                            Image(playerLines.rowOne.rawValue)
                                .resizable()
                                .frame(width: 44, height: 44)
                        })
                    }
                    GridRow {
                        // Spacer to push the content the right
                        ForEach(1..<4) { i in
                            Spacer().gridCellUnsizedAxes([.horizontal, .vertical])
                        }
                        
                        Button(action: {
                            playerLines.rowTwo.tile1Color = selectedTile
                        }, label: {
                            Image(playerLines.rowTwo.tile1Color.rawValue)
                                .resizable()
                                .frame(width: 44, height: 44)
                        })
                        Button(action: {
                            playerLines.rowTwo.tile2Color = selectedTile
                        }, label: {
                            Image(playerLines.rowTwo.tile2Color.rawValue)
                                .resizable()
                                .frame(width: 44, height: 44)
                        })
                    }
                    GridRow {
                        // Spacer to push the content the right
                        ForEach(1..<3) { i in
                            Spacer().gridCellUnsizedAxes([.horizontal, .vertical])
                        }
                        
                        Button(action: {
                            playerLines.rowThree.tile1Color = selectedTile
                        }, label: {
                            Image(playerLines.rowThree.tile1Color.rawValue)
                                .resizable()
                                .frame(width: 44, height: 44)
                        })
                        Button(action: {
                            playerLines.rowThree.tile2Color = selectedTile
                        }, label: {
                            Image(playerLines.rowThree.tile2Color.rawValue)
                                .resizable()
                                .frame(width: 44, height: 44)
                        })
                        Button(action: {
                            playerLines.rowThree.tile3Color = selectedTile
                        }, label: {
                            Image(playerLines.rowThree.tile3Color.rawValue)
                                .resizable()
                                .frame(width: 44, height: 44)
                        })
                    }
                    GridRow {
                        // Spacer to push the content the right
                        Spacer().gridCellUnsizedAxes([.horizontal, .vertical])
                        
                        Button(action: {
                            playerLines.rowFour.tile1Color = selectedTile
                        }, label: {
                            Image(playerLines.rowFour.tile1Color.rawValue)
                                .resizable()
                                .frame(width: 44, height: 44)
                        })
                        Button(action: {
                            playerLines.rowFour.tile2Color = selectedTile
                        }, label: {
                            Image(playerLines.rowFour.tile2Color.rawValue)
                                .resizable()
                                .frame(width: 44, height: 44)
                        })
                        Button(action: {
                            playerLines.rowFour.tile3Color = selectedTile
                        }, label: {
                            Image(playerLines.rowFour.tile3Color.rawValue)
                                .resizable()
                                .frame(width: 44, height: 44)
                        })
                        Button(action: {
                            playerLines.rowFour.tile4Color = selectedTile
                        }, label: {
                            Image(playerLines.rowFour.tile4Color.rawValue)
                                .resizable()
                                .frame(width: 44, height: 44)
                        })
                        
                        
                    }
                    GridRow {
                        // row 5
                        Button(action: {
                            playerLines.rowFive.tile1Color = selectedTile
                        }, label: {
                            Image(playerLines.rowFive.tile1Color.rawValue)
                                .resizable()
                                .frame(width: 44, height: 44)
                        })
                        Button(action: {
                            playerLines.rowFive.tile2Color = selectedTile
                        }, label: {
                            Image(playerLines.rowFive.tile2Color.rawValue)
                                .resizable()
                                .frame(width: 44, height: 44)
                        })
                        Button(action: {
                            playerLines.rowFive.tile3Color = selectedTile
                        }, label: {
                            Image(playerLines.rowFive.tile3Color.rawValue)
                                .resizable()
                                .frame(width: 44, height: 44)
                        })
                        Button(action: {
                            playerLines.rowFive.tile4Color = selectedTile
                        }, label: {
                            Image(playerLines.rowFive.tile4Color.rawValue)
                                .resizable()
                                .frame(width: 44, height: 44)
                        })
                        Button(action: {
                            playerLines.rowFive.tile5Color = selectedTile
                        }, label: {
                            Image(playerLines.rowFive.tile5Color.rawValue)
                                .resizable()
                                .frame(width: 44, height: 44)
                        })

                    }
                }
                WallView(spaceOccupied: $occupied, wall: $wall)
            }
        }
    }
}

#Preview {
    PlayerBoardView(selectedTile: .constant(LineOptions.red))
}
