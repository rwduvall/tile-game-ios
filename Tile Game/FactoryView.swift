//
//  BoardView.swift
//  Tile Game
//
//  Created by Robbie Duvall on 6/11/23.
//

import SwiftUI

// IDEA: change to enum to make things a bit easier and on var could be the contents
struct Factories {
    var factory1: [LineOption]
    var factory2: [LineOption]
    var factory3: [LineOption]
    var factory4: [LineOption]
    
    mutating func remove(selected: LineOption, from factory: String, index: Int) {
        switch factory {
        case "factory1":
            factory1.remove(at: index)
        case "factory2":
            factory2.remove(at: index)
        case "factory3":
            factory3.remove(at: index)
        case "factory4":
            factory4.remove(at: index)
        default:
            break
        }
    }
}

struct FactoryView: View {
    @Binding var factories: Factories
    
    /// Get the tile to be displayed on the factory
    /// - Parameters:
    ///   - factory: the array of items to pull the tiles from
    ///   - placement: where the tile is located in the array
    ///   - factoryName: the name of the factory
    /// - Returns: a view of the tile
    func getTile(from factory: Array<LineOption>, placement: Int, factoryName: String) -> some View {
        let imageName = placement >= factory.count ? "emptySpace" : factory[placement].rawValue
        
        return TileView(LineOption(rawValue: imageName) ?? .emptySpace)
            .draggable(
                DraggableTile(
                    id: UUID(),
                    color: factory[placement],
                    factoryName: factoryName,
                    index: placement
                )
            )
    }

    var body: some View {
        ScrollView {
            HStack {
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12.0).frame(width: 120, height: 120).padding()
                        Grid {
                            GridRow {
                                getTile(from: factories.factory1, placement: 0, factoryName: "factory1")
                                getTile(from: factories.factory1, placement: 1, factoryName: "factory1")
                            }
                            GridRow {
                                getTile(from: factories.factory1, placement: 2, factoryName: "factory1")
                                getTile(from: factories.factory1, placement: 3, factoryName: "factory1")
                            }
                        }
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 12.0).frame(width: 120, height: 120).padding()
                        Grid {
                            GridRow {
                                getTile(from: factories.factory2, placement: 0, factoryName: "factory2")
                                getTile(from: factories.factory2, placement: 1, factoryName: "factory2")
                            }
                            GridRow {
                                getTile(from: factories.factory2, placement: 2, factoryName: "factory2")
                                getTile(from: factories.factory2, placement: 3, factoryName: "factory2")
                            }
                        }
                    }
                }
                
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12.0).frame(width: 120, height: 120).padding()
                        Grid {
                            GridRow {
                                getTile(from: factories.factory3, placement: 0, factoryName: "factory3")
                                getTile(from: factories.factory3, placement: 1, factoryName: "factory3")
                            }
                            GridRow {
                                getTile(from: factories.factory3, placement: 2, factoryName: "factory3")
                                getTile(from: factories.factory3, placement: 3, factoryName: "factory3")
                            }
                        }
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 12.0).frame(width: 120, height: 120).padding()
                        Grid {
                            GridRow {
                                getTile(from: factories.factory4, placement: 0, factoryName: "factory4")
                                getTile(from: factories.factory4, placement: 1, factoryName: "factory4")
                            }
                            GridRow {
                                getTile(from: factories.factory4, placement: 2, factoryName: "factory4")
                                getTile(from: factories.factory4, placement: 3, factoryName: "factory4")
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    FactoryView(factories: .constant(Factories(
        factory1: [.yellow, .yellow, .black, .white],
        factory2: [.white, .red, .black, .white],
        factory3: [.red, .red, .yellow, .black],
        factory4: [.blue, .white, .black, .red]
    )))
}
