//
//  Game.swift
//  Millionaire
//
//  Created by Pavel Olegovich on 29.01.2022.
//

import Foundation

class Game {
    static let shared = Game()
    
//    var gameSession: GameSession?
    var isActiveRandom: Bool? = false
    
    private let resultCaretaker = CaretakerGameSession()
    
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
    
    func toggleIsActive() {
        self.isActiveRandom?.toggle()
    }
}
