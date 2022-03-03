//
//  CaretakerUserQuestions.swift
//  Millionaire
//
//  Created by Pavel Olegovich on 05.02.2022.
//

import Foundation

class CaretakerUserQuestions {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private var questions: [Question] {
        load()
    }
    private let key = "CaretakerUserQuestionsKey"
    
    func save(question: [Question]) {
        var oldQuestion = questions
        oldQuestion.append(contentsOf: question)
        do {
            let data = try encoder.encode(oldQuestion)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func load() -> [Question] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        
        do {
            return try decoder.decode([Question].self, from: data)
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    
}
