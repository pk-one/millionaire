//
//  RandomQuestions.swift
//  Millionaire
//
//  Created by Pavel Olegovich on 05.02.2022.
//

import Foundation

class RandomQuestions: StrategyProtocol {    
    private let countQuestion = NumberQuestion.allCases.count //берем кол-во вопросов из енама
    private var countQuestionArray = [Int]()
    
    
    func generateQuestionsArray() -> [Question] {
        var questionsArray = [Question]()
        countQuestionArray  = Array(1...countQuestion)
        
        while !countQuestionArray.isEmpty {
            let randomIndex = Int(arc4random_uniform(UInt32(countQuestionArray.count)))
            let randomNumber = countQuestionArray[randomIndex]
            countQuestionArray.remove(at: randomIndex)
            
            let randomNumberQuestion = generateRandomNumberQuestion(number: randomNumber) // генерируем вопрос по рандомному числу
            
            let question = Question.getQuestion(with: randomNumberQuestion) // получаем вопрос
            questionsArray.append(question)
        }
        
        return questionsArray
    }
    
    private func generateRandomNumberQuestion(number: Int) -> NumberQuestion {
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
