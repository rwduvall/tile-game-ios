//
//  PlayerBoardView.swift
//  Tile Game
//
//  Created by Robbie Duvall on 6/13/23.
//

import SwiftUI

enum LineOption: String, Equatable {
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

struct PlayerBoardView: View {
    @Binding var selectedTile: LineOption
    
    @State private var playerLines: Lines = Lines(
        rowOne: Line(numOfSpaces: 1, numOfOccupiedSpaces: 0, color: .emptySpace),
        rowTwo: Line(numOfSpaces: 2, numOfOccupiedSpaces: 0, color: .emptySpace),
        rowThree: Line(numOfSpaces: 3, numOfOccupiedSpaces: 0, color: .emptySpace),
        rowFour: Line(numOfSpaces: 4, numOfOccupiedSpaces: 0, color: .emptySpace),
        rowFive: Line(numOfSpaces: 5, numOfOccupiedSpaces: 0, color: .emptySpace)
    )
    @State private var wall = WallModel()
    @State private var occupied = false
    @State private var floorRow: [LineOption] = []
    
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
        @Binding var newColor: LineOption
        @Binding var floorTiles: [LineOption]
        @State var isAlertShown = false
        @State var isDropTargeted = false
        
        var body: some View {
            HStack {
                ForEach(0..<self.line.numberOfEmptySpaces(), id: \.self) { _ in
                    Image(LineOption.emptySpace.rawValue)
                        .resizable()
                        .frame(width: 44, height: 44)
                        .dropDestination(for: String.self) {
                            receivedString,
                            _ in
                            if let droppedTile = LineOption(
                                rawValue: receivedString.first ?? LineOption.emptySpace.rawValue
                            ) {
                                if droppedTile == .emptySpace {
                                    return false
                                }
                                if self.line.color != .emptySpace && droppedTile != self.line.color {
                                    isAlertShown = true
                                    return false
                                }
                                self.line.color = droppedTile
                                line.numOfOccupiedSpaces += 1
                                return true
                            }
                            return false
                        } isTargeted: {
                            isDropTargeted = $0
                        }
                        .opacity(isDropTargeted ? 0.5 : 0.9)
                }
                
                ForEach(0..<self.line.numOfOccupiedSpaces, id: \.self) { _ in
                    Image(self.line.color.rawValue)
                        .resizable()
                        .frame(width: 44, height: 44)
                }
            }
            .alert(isPresented: $isAlertShown, content: {
                Alert(title: Text("That can't go here"), message: Text("Put tiles in a different row that is empty or has matching colors"), dismissButton: .default(Text("OK")))
            })
        }
    }
    
    var body: some View {
        ScrollView(.horizontal) {
            endRound()
            // section where you play tiles
            HStack {
                VStack {
                    Grid(alignment: .trailing) {
                        createRow(
                            line: $playerLines.rowOne,
                            newColor: $selectedTile,
                            floorTiles: $floorRow
                        )
                        createRow(
                            line: $playerLines.rowTwo,
                            newColor: $selectedTile,
                            floorTiles: $floorRow
                        )
                        createRow(
                            line: $playerLines.rowThree,
                            newColor: $selectedTile,
                            floorTiles: $floorRow
                        )
                        createRow(
                            line: $playerLines.rowFour,
                            newColor: $selectedTile,
                            floorTiles: $floorRow
                        )
                        createRow(
                            line: $playerLines.rowFive,
                            newColor: $selectedTile,
                            floorTiles: $floorRow
                        )
                    }
                    // This creates the floor row
                    ForEach(floorRow, id: \.self) { floorTile in
                        Image(floorTile.rawValue)
                            .resizable()
                            .frame(width: 44, height: 44)
                    }
                }
                WallView(spaceOccupied: $occupied, wall: $wall)
            }
        }
    }
}


#Preview {
    PlayerBoardView(selectedTile: .constant(LineOption.red))
}
