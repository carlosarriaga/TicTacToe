//
//  Game.swift
//  TicTacToe
//
//  Created by Carlos Arriaga on 06/05/24.
//

import Foundation
import SwiftUI

class Game: ObservableObject {
    
    @Published var TicTacToeModel = TicTacToe()
    
    var currentTurn: Turn {
        TicTacToeModel.currentTurn
    }
    
    var board: [Turn] {
        TicTacToeModel.matrix
    }
    
    func choose(_ boxIndex: Int) {
        TicTacToeModel.choose(boxIndex)
    }
}
