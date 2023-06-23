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

struct Line {
    var numOfSpaces: Int
    var numOfOccupiedSpaces: Int
    var color: LineOptions
    
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

struct PlayerBoardView: View {
    @Binding var selectedTile: LineOptions
    @Binding var numberOfPlacedTiles: Int
    
    @State private var playerLines: Lines = Lines(
        rowOne: Line(numOfSpaces: 1, numOfOccupiedSpaces: 0, color: .emptySpace),
        rowTwo: Line(numOfSpaces: 2, numOfOccupiedSpaces: 0, color: .emptySpace),
        rowThree: Line(numOfSpaces: 3, numOfOccupiedSpaces: 0, color: .emptySpace),
        rowFour: Line(numOfSpaces: 4, numOfOccupiedSpaces: 0, color: .emptySpace),
        rowFive: Line(numOfSpaces: 5, numOfOccupiedSpaces: 0, color: .emptySpace)
    )
    @State private var wall = WallModel()
    @State private var occupied = false
    
    func endRound() -> some View {
        Button(action: {
            switch playerLines.rowOne.color {
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
            playerLines.rowOne.color = .emptySpace
                
            if (playerLines.rowTwo.color == playerLines.rowTwo.color) {
                    switch playerLines.rowTwo.color {
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
                    playerLines.rowTwo.color = .emptySpace
                    playerLines.rowTwo.color = .emptySpace
                }
                // TODO: the rest of the rows
//            }

        }, label: {
            Text("end round")
        })
    }
    
    struct createRow: View {
        @Binding var line: Line
        @Binding var numOfPlacedTiles: Int
        @Binding var newColor: LineOptions
        @State var isAlertShown = false
        
        var body: some View {
            HStack {
                // TODO: handle for more items than can fit
                // TODO: guard for color match

                ForEach(0..<line.numberOfEmptySpaces(), id: \.self) { _ in
                    Button(action: {
                        guard line.color == newColor || line.color == LineOptions.emptySpace else {
                            isAlertShown = true
                            return
                        }
                        
                        line.color = newColor
                        line.numOfOccupiedSpaces = numOfPlacedTiles + line.numOfOccupiedSpaces
                    }, label: {
                        Image(.emptySpace) // setting this color wrong
                            .resizable()
                            .frame(width: 44, height: 44)
                    })
                    .alert(isPresented: $isAlertShown, content: {
                        Alert(title: Text("That can't go here"), message: Text("Put tiles in a differnt row that is empty or has matching colors"), dismissButton: .default(Text("OK")))
                    })
                }
                
                ForEach(0..<line.numOfOccupiedSpaces, id: \.self) { _ in
                    Image(line.color.rawValue)
                        .resizable()
                        .frame(width: 44, height: 44)
                }
            }
        }
    }
    
    var body: some View {
        ScrollView(.horizontal) {
            endRound()
            // section where you play tiles
            HStack {
                Grid(alignment: .trailing) {
                    createRow(line: $playerLines.rowOne, numOfPlacedTiles: $numberOfPlacedTiles, newColor: $selectedTile)
                    createRow(line: $playerLines.rowTwo, numOfPlacedTiles: $numberOfPlacedTiles, newColor: $selectedTile)
                    createRow(line: $playerLines.rowThree, numOfPlacedTiles: $numberOfPlacedTiles, newColor: $selectedTile)
                    createRow(line: $playerLines.rowFour, numOfPlacedTiles: $numberOfPlacedTiles, newColor: $selectedTile)
                    createRow(line: $playerLines.rowFive, numOfPlacedTiles: $numberOfPlacedTiles, newColor: $selectedTile)
                }
                WallView(spaceOccupied: $occupied, wall: $wall)
            }
        }
    }
}


#Preview {
    PlayerBoardView(selectedTile: .constant(LineOptions.red), numberOfPlacedTiles: .constant(1))
}
