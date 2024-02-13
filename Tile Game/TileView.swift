//
//  TileView.swift
//  Tile Game
//
//  Created by Robbie Duvall on 2/8/24.
//

import SwiftUI

struct TileView: View {
    let color: LineOption
    
    init(_ color: LineOption) {
        self.color = color
    }
    
    init(_ color: WallModel.TileColor) {
        switch color {
        case .blue:
            self.color = .blue
        case .black:
            self.color = .black
        case .red:
            self.color = .red
        case .white:
            self.color = .white
        case .yellow:
            self.color = .yellow
        }
    }
    
    var body: some View {
        Image(color.rawValue)
            .resizable()
            .frame(width: 44, height: 44)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    TileView(LineOption.black)
}
