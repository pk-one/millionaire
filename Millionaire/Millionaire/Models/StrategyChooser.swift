//
//  StrategyChooser.swift
//  Millionaire
//
//  Created by Pavel Olegovich on 05.02.2022.
//

import Foundation

class StrategyChooser {
    var strategy: StrategyProtocol!
    
    init(strategy: StrategyProtocol) {
        self.strategy = strategy
    }
    
    func getQuestions() -> [Question] {
        strategy.generateQuestionsArray()
    }
}
