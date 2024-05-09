//
//  ContentView.swift
//  TicTacToe
//
//  Created by Carlos Arriaga on 06/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var game: Game
    
    var body: some View {
        
        VStack{
            
            //MARK: Info
            //Player One or Player Two
            Text(game.currentTurn.rawValue)
            
            //MARK: Tablero
            VStack{
                LazyVGrid(columns: Array(repeating: GridItem(), count: 3), spacing: 25) {
                    ForEach(game.board.indices) { index in
                        BoxView(turn: game.board[index])
                            .onTapGesture {
                                game.choose(index)
                            }
                    }
                }
                .padding()
                
            }
        }
    }//Body
    
  
}




struct BoxView: View {

    var turn: Turn
    
    private var boxColor: Color {
        switch turn {
        case .cross:
            return .blue
        case .nought:
            return .red
        case .empty:
            return .gray
        }
    }//boxColor

    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(boxColor)
            .frame(width: 100, height: 100)
            .overlay(
                Text(turn == .empty ? "" : (turn == .cross ? "X" : "O"))
                    .font(.title)
                    .foregroundColor(.white)
            )
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = Game()
        ContentView(game: game)
    }
}
