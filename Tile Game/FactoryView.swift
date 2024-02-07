//
//  BoardView.swift
//  Tile Game
//
//  Created by Robbie Duvall on 6/11/23.
//

import SwiftUI

// change to enum to make things a bit easier and on var could be the contents
struct Factories {
    var factory1: [LineOption]
    var factory2: [LineOption]
    var factory3: [LineOption]
    var factory4: [LineOption]
    
    mutating func remove(selected: LineOption, from factory: String) -> Int {
        var numberOfOcurrencesInFactory = 0
        switch factory {
        case "factory1":
            numberOfOcurrencesInFactory = factory1.filter { $0 == selected }.count
            factory1.removeAll { lineO in
                lineO == selected
            }
        case "factory2":
            numberOfOcurrencesInFactory = factory2.filter { $0 == selected }.count
            factory2.removeAll { lineO in
                lineO == selected
            }
        case "factory3":
            numberOfOcurrencesInFactory = factory3.filter { $0 == selected }.count
            factory3.removeAll { lineO in
                lineO == selected
            }
        case "factory4":
            numberOfOcurrencesInFactory = factory4.filter { $0 == selected }.count
            factory4.removeAll { lineO in
                lineO == selected
            }
        default:
            break
        }
        return numberOfOcurrencesInFactory
    }
}

struct FactoryView: View {
    @State private var factories: Factories = Factories(
        factory1: [.yellow, .yellow, .black, .white],
        factory2: [.white, .red, .black, .white],
        factory3: [.red, .red, .yellow, .black],
        factory4: [.blue, .white, .black, .red]
    )
    
    @Binding var selectedTile: LineOption
    @State private var filteredFac = []

    func getTile(from factory: Array<LineOption>, placement: Int, factoryName: String) -> some View {
        guard placement <= factory.count else {
            // this should probably be and error not empty space
            return Button(action: {}, label: {
                Image(.emptySpace)
                    .resizable()
                    .frame(width: 44, height: 44)
            })
            .draggable(LineOption.emptySpace.rawValue)
        }
        
        let imageName = placement >= factory.count ? "emptySpace" : factory[placement].rawValue
        
        return Button(action: {
            selectedTile = factory[placement]
        }, label: {
            
            Image(imageName)
                .resizable()
                .frame(width: 44, height: 44)
        })
        .draggable(imageName)
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

enum MyError: Error {
    case invalidInput
}

#Preview {
    FactoryView(selectedTile: .constant(.black))
}
