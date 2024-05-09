//
//  TicTacToe.swift
//  TicTacToe
//
//  Created by Carlos Arriaga on 06/05/24.
//

import Foundation

struct TicTacToe {
    
    //MARK: Tablero
    //Registra el estado de cada casilla en el tablero
    var matrix: [Turn]
    
    //MARK: Turno actual
    //Controla que jugador tiene el turno
    var currentTurn: Turn
    
    
    init(){
        matrix = Array(repeating: .empty, count: 9)
        currentTurn = .cross
    }
    
    //MARK: Elige casilla
    //Si la casilla es vacia, deja elegir
    //Si el tiro da victoria, se acaba el juego
    //Si el tiro NO  da victoria, cambia de turno
    mutating func choose(_ boxIndex: Int) {
        if matrix[boxIndex] == .empty {
                matrix[boxIndex] = currentTurn == .cross ? .cross : .nought
                if isVictory() {
                    matrix = Array(repeating: currentTurn, count: 9)
                } else {
                    toogleTurn()
                }
            }
    }
    
    //MARK: Cambiar de jugador
    private mutating func toogleTurn(){
        currentTurn = currentTurn == .cross ? .nought : .cross
    }
    
    //MARK: Revisar victoria
    // 0 | 1 | 2
    // 3 | 4 | 5
    // 6 | 7 | 8
    private func isVictory() -> Bool {
        
        let winCombinations: [[Int]] = [
            [0, 1, 2],//Horizontal
            [3, 4, 5],
            [6, 7, 8],
            [0, 3, 6],//Vertical
            [1, 4, 7],
            [2, 5, 8],
            [0, 4, 8],//Diagonal
            [6, 4, 2]
        ]
        
        for combination in winCombinations {
            let (a,b,c) = (combination[0], combination[1], combination[2])
            if matrix[a] == currentTurn, matrix[b] == currentTurn, matrix[c] == currentTurn {
                return true
            }
        }
        return false
    }
    
}//Tic Tac Toe


enum Turn: String {
    case cross = "Player One"
    case nought = "Player Two"
    case empty
}
