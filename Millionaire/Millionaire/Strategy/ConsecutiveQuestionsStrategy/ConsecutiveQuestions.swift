//
//  ConsecutiveQuestions.swift
//  Millionaire
//
//  Created by Pavel Olegovich on 05.02.2022.
//

import Foundation

class ConsecutiveQuestions: StrategyProtocol {
    
    private let countQuestion = NumberQuestion.allCases.count
    private var countQuestionArray = [Int]()
    
    func generateQuestionsArray() -> [Question] {
        var questionsArray = [Question]()
        countQuestionArray  = Array(1...countQuestion)
        var index = 0
        
        while !countQuestionArray.isEmpty {
            index += 1
            countQuestionArray.removeFirst()
            let numberQuestion = numberQuestion(number: index) // генерируем вопрос по рандомному числу
            let question = Question.getQuestion(with: numberQuestion) // получаем вопрос
            
            questionsArray.append(question)
        }
        
        return questionsArray
    }
    
    private func numberQuestion(number: Int) -> NumberQuestion {
        switch number {
        case 2: return .two
        case 3: return .three
        case 4: return .four
        case 5: return .five
        case 6: return .six
        case 7: return .seven
        default: return .one
        }
        
    }
}
