//
//  RandomQuestions.swift
//  Millionaire
//
//  Created by Pavel Olegovich on 05.02.2022.
//

import Foundation

class RandomQuestions: StrategyProtocol {
    func generateQuestionsArray() -> [Question] {
        let saver = CaretakerUserQuestions()
   
        var questions = Question.getQuestion
        questions.append(contentsOf: saver.load())
        return questions.shuffled()
        
    }
}
