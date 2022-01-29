//
//  Game.swift
//  Millionaire
//
//  Created by Pavel Olegovich on 29.01.2022.
//

import Foundation

class Game {
    static let shared = Game()
    
    var gameSession: GameSession?
    
    private let resultCaretaker = Caretaker()
    
    private init() {
        gameResults = resultCaretaker.load() ?? []
    }
    
    var gameResults: [GameSession] {
        didSet {
            resultCaretaker.save(results: gameResults)
        }
    }
    
    func addResult(with result: GameSession) {
        gameResults.append(result)
    }
    
    func clearResult() {
        self.gameResults = []
    }
}
