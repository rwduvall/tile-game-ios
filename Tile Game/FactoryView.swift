//
//  BoardView.swift
//  Tile Game
//
//  Created by Robbie Duvall on 6/11/23.
//

import SwiftUI

struct Factories {
    var factory1: [LineOptions]
    var factory2: [LineOptions]
    var factory3: [LineOptions]
    var factory4: [LineOptions]
    
    mutating func filterFactory(factoryName: String, filterClosure: (LineOptions) -> Bool) -> [LineOptions] {
        var filteredArray: [LineOptions] = []
        
        switch factoryName {
        case "factory1":
            filteredArray = factory1.filter(filterClosure)
        case "factory2":
            filteredArray = factory2.filter(filterClosure)
        case "factory3":
            filteredArray = factory3.filter(filterClosure)
        case "factory4":
            filteredArray = factory4.filter(filterClosure)
        default:
            break
        }
        
        return filteredArray
    }
}

struct FactoryView: View {
    @State private var factories: Factories = Factories(
        factory1: [.yellow, .red, .black, .white],
        factory2: [.white, .red, .black, .white],
        factory3: [.red, .red, .yellow, .black],
        factory4: [.blue, .white, .black, .red]
    )
    
    @State private var selectedTile = LineOptions.emptySpace
    @State private var filteredFac = []

    func getTile(from factory: Array<LineOptions>, placement: Int) -> some View {
        // I should add this later to make sure I don't cause errors or protect against this some how
//        guard placement > 3 else {
//            throw MyError.invalidInput
//        }
        
        guard placement <= 3 else {
            // this should probably be and error not empty space
            return Button(action: {}, label: {
                Image(.emptySpace)
                    .resizable()
                    .frame(width: 44, height: 44)
            })
        }
        
        return Button(action: {
            selectedTile = factory[placement]
            // how do I use this?
            
//            factories.filterFactory(factoryName: factoryName, filterClosure: { foo in
//                foo != selectedTile
//            })
            
        }, label: {
            Image(factory[placement].rawValue)
                .resizable()
                .frame(width: 44, height: 44)
        })
        
    }

    var body: some View {
        ScrollView {
//            Text(selectedTile)
            HStack {
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12.0).frame(width: 120, height: 120).padding()
                        Grid {
                            GridRow {
                                getTile(from: factories.factory1, placement: 0)
                                getTile(from: factories.factory1, placement: 1)
                            }
                            GridRow {
                                getTile(from: factories.factory1, placement: 2)
                                getTile(from: factories.factory1, placement: 3)
                            }
                        }
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 12.0).frame(width: 120, height: 120).padding()
                        Grid {
                            GridRow {
                                getTile(from: factories.factory2, placement: 0)
                                getTile(from: factories.factory2, placement: 1)
                            }
                            GridRow {
                                getTile(from: factories.factory2, placement: 2)
                                getTile(from: factories.factory2, placement: 3)
                            }
                        }
                    }
                }
                
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12.0).frame(width: 120, height: 120).padding()
                        Grid {
                            GridRow {
                                getTile(from: factories.factory3, placement: 0)
                                getTile(from: factories.factory3, placement: 1)
                            }
                            GridRow {
                                getTile(from: factories.factory3, placement: 2)
                                getTile(from: factories.factory3, placement: 3)
                            }
                        }
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 12.0).frame(width: 120, height: 120).padding()
                        Grid {
                            GridRow {
                                getTile(from: factories.factory4, placement: 0)
                                getTile(from: factories.factory4, placement: 1)
                            }
                            GridRow {
                                getTile(from: factories.factory4, placement: 2)
                                getTile(from: factories.factory4, placement: 3)
                            }
                        }
                    }
                }
            }
            Text("Player 1")
            PlayerBoardView(selectedTile: $selectedTile)
            Spacer(minLength: 30)
            Text("Player 2")
            PlayerBoardView(selectedTile: $selectedTile)
        }
    }
}

enum MyError: Error {
    case invalidInput
}

#Preview {
    FactoryView()
}
