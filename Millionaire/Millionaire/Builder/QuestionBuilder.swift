//
//  QuestionBuilder.swift
//  Millionaire
//
//  Created by Pavel Olegovich on 06.02.2022.
//

import Foundation

class QuestionBuilder {
    var questionString: String?
    var answers = [Answer]()
    
    func setQuestion(questionString: String) {
        self.questionString = questionString
    }
    
    func setAnswers(answer: Answer) {
        self.answers.append(answer)
    }
    
    
    func buildQuestion() -> [Question] {
        guard let questionString = questionString else { return [] }
        var arrayQuestions = [Question]()
        let question = Question(question: questionString, answer: answers)
        arrayQuestions.append(question)
        return arrayQuestions
    }
}
