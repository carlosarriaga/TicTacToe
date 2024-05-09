//
//  TicTacToeApp.swift
//  TicTacToe
//
//  Created by Carlos Arriaga on 06/05/24.
//

import SwiftUI

@main
struct TicTacToeApp: App {
    var body: some Scene {
        WindowGroup {
            let game = Game()
            ContentView(game: game)
        }
    }
}
