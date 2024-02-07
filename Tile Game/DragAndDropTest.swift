//
//  DragAndDropTest.swift
//  Tile Game
//
//  Created by Robbie Duvall on 2/7/24.
//

import SwiftUI

struct DragAndDropTest: View {
    @State var isDropTargeted = false
    @State var dropTarget: LineOption = .emptySpace
    
    var body: some View {
        Image(LineOption.red.rawValue)
            .resizable()
            .frame(width: 40, height: 40)
            .draggable(LineOption.red.rawValue)
        
        Image(LineOption.blue.rawValue)
            .resizable()
            .frame(width: 40, height: 40)
            .draggable(LineOption.blue.rawValue)
        
        Image(dropTarget.rawValue)
            .resizable()
            .frame(width: 44, height: 44)
            .dropDestination(for: String.self) { receivedString, _ in
                if let droppedTile = LineOption(rawValue: receivedString.first ?? LineOption.emptySpace.rawValue) {
                    print(droppedTile)
                    dropTarget = droppedTile
                    return true
                }
                return false
            } isTargeted: {
                isDropTargeted = $0
            }
    }
}

#Preview {
    DragAndDropTest()
}
