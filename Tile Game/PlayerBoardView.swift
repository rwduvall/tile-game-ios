//
//  PlayerBoardView.swift
//  Tile Game
//
//  Created by Robbie Duvall on 6/13/23.
//

import SwiftUI

struct PlayerBoardView: View {
    @Binding var factories: Factories
    
    @State private var playerLines: Lines = Lines(
        rowOne: Line(numOfSpaces: 1, numOfOccupiedSpaces: 0, color: .emptySpace),
        rowTwo: Line(numOfSpaces: 2, numOfOccupiedSpaces: 0, color: .emptySpace),
        rowThree: Line(numOfSpaces: 3, numOfOccupiedSpaces: 0, color: .emptySpace),
        rowFour: Line(numOfSpaces: 4, numOfOccupiedSpaces: 0, color: .emptySpace),
        rowFive: Line(numOfSpaces: 5, numOfOccupiedSpaces: 0, color: .emptySpace)
    )
    @State private var wall = WallModel()
    @State private var floorRow: [LineOption] = []
    @State var isDropTargeted = false
    
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
            playerLines.rowOne.color = .emptySpace
            playerLines.rowOne.numOfOccupiedSpaces = 0
            
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
                playerLines.rowTwo.numOfOccupiedSpaces = 0
            }
            // TODO: the rest of the rows
        }, label: {
            Text("End round")
            
        })
        .buttonStyle(.bordered)
    }
    
    struct createRow: View {
        @Binding var factories: Factories
        @Binding var line: Line
        @Binding var floorTiles: [LineOption]
        @State var isAlertShown = false
        @State var isDropTargeted = false
        
        var body: some View {
            HStack {
                ForEach(0..<self.line.numberOfEmptySpaces(), id: \.self) { _ in
                    TileView(.emptySpace)
                        .dropDestination(for: DraggableTile.self) {
                            receivedTile,
                            _ in
                            if let droppedTile = receivedTile.first {
                                if droppedTile.color == .emptySpace {
                                    return false
                                }
                                if self.line.color != .emptySpace && droppedTile.color != self.line.color {
                                    isAlertShown = true
                                    return false
                                }
                                self.line.color = droppedTile.color
                                line.numOfOccupiedSpaces += 1
                                
                                // remove from factory on successful drop
                                self.factories.remove(selected: droppedTile.color, from: droppedTile.factoryName, index: droppedTile.index)
                                
                                return true
                            }
                            return false
                        } isTargeted: {
                            isDropTargeted = $0
                        }
                        .opacity(isDropTargeted ? 0.5 : 0.9)
                }
                
                ForEach(0..<self.line.numOfOccupiedSpaces, id: \.self) { _ in
                    TileView(self.line.color)
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
                            factories: $factories,
                            line: $playerLines.rowOne,
                            floorTiles: $floorRow
                        )
                        createRow(
                            factories: $factories,
                            line: $playerLines.rowTwo,
                            floorTiles: $floorRow
                        )
                        createRow(
                            factories: $factories,
                            line: $playerLines.rowThree,
                            floorTiles: $floorRow
                        )
                        createRow(
                            factories: $factories,
                            line: $playerLines.rowFour,
                            floorTiles: $floorRow
                        )
                        createRow(
                            factories: $factories,
                            line: $playerLines.rowFive,
                            floorTiles: $floorRow
                        )
                    }
                    // This creates the floor row
                    HStack {
                        Text("Floor tiles")
                        ForEach(floorRow, id: \.self) { floorTile in
                            TileView(floorTile)
                        }
                        
                        TileView(.emptySpace)
                            .dropDestination(for: DraggableTile.self) {
                                receivedTile,
                                _ in
                                if let droppedTile = receivedTile.first {
                                    if droppedTile.color == .emptySpace {
                                        return false
                                    }
                                    
                                    floorRow.append(droppedTile.color)
                                    
                                    // remove from factory on successful drop
                                    self.factories.remove(
                                        selected: droppedTile.color,
                                        from: droppedTile.factoryName,
                                        index: droppedTile.index
                                    )
                                    
                                    return true
                                }
                                return false
                            } isTargeted: {
                                isDropTargeted = $0
                            }
                            .opacity(isDropTargeted ? 0.5 : 0.9)
                    }
                }
                VStack {
                    WallView(wall: $wall)
                        .padding(.bottom, 50)
                }
            }
        }
    }
}


#Preview {
    PlayerBoardView(factories: .constant(Factories(
        factory1: [.yellow, .yellow, .black, .white],
        factory2: [.white, .red, .black, .white],
        factory3: [.red, .red, .yellow, .black],
        factory4: [.blue, .white, .black, .red]
    )))
}
