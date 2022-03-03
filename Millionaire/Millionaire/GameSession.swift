//
//  GameSession.swift
//  Millionaire
//
//  Created by Pavel Olegovich on 29.01.2022.
//

import Foundation
import UIKit

class GameSession: Codable {
    
    var countQuestion = 0
    var countCorrectQuestions = 0
    
    init(countQuestion: Int, countCorrectQuestions: Int) {
        self.countQuestion = countQuestion
        self.countCorrectQuestions = countCorrectQuestions
    }
}
