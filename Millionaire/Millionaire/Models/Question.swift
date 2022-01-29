//
//  Question.swift
//  Millionaire
//
//  Created by Pavel Olegovich on 28.01.2022.
//

import Foundation

enum NumberQuestion: String, CaseIterable {
    case one = "1"
    case two = "2"
//    case three = "3"
//    case four = "4"
//    case five = "5"
//    case six = "6"
//    case seven = "7"
}

struct Answer {
    let answer: String
}

struct Question {
    let question: String
    let numberQuestion: NumberQuestion
    let answer: [Answer]
    let correctAnswer: Int
    
    static func getQuestion(with: NumberQuestion) -> Question {
        
        switch with {
        case .one:
            return Question(question: "На вершине какой горы расположена сорокаметровая статуя Христа, являющаяся символом Рио-де-Жанейро?",
                            numberQuestion: .one,
                            answer: [Answer(answer: "Тупунгато"),
                                     Answer(answer: "Корковадо"),
                                     Answer(answer: "Уаскаран"),
                                     Answer(answer: "Ильимани")],
                            correctAnswer: 2)
        case .two:
            return Question(question: "Какое брюхо, согласно спорной русской пословице, глухо к ученью?",
                            numberQuestion: .one,
                            answer: [Answer(answer: "Сытое"),
                                     Answer(answer: "Толстое"),
                                     Answer(answer: "Тощее"),
                                     Answer(answer: "Пустое")],
                            correctAnswer: 1)
//        case .three:
//            return Question(question: "Какая из этих кислот является витамином?",
//                            numberQuestion: .one,
//                            answer: [Answer(answer: "Молочная"),
//                                     Answer(answer: "Янтарная"),
//                                     Answer(answer: "Яблочная"),
//                                     Answer(answer: "Никотиновая")],
//                            correctAnswer: 4)
//        case .four:
//            return Question(question: "Кто является чемпионом гонок 'Формулы-1' 1998-99 г.г.?",
//                            numberQuestion: .one,
//                            answer: [Answer(answer: "Шумахер"),
//                                     Answer(answer: "Хаккинен"),
//                                     Answer(answer: "Барикелло"),
//                                     Answer(answer: "Кулхард")],
//                            correctAnswer: 2)
//        case .five:
//            return Question(question: "Какой цвет волос был у возлюбленной Тристана Изольды, если верить Бедье?",
//                            numberQuestion: .one,
//                            answer: [Answer(answer: "Каштановый"),
//                                     Answer(answer: "Рыжий"),
//                                     Answer(answer: "Вороново крыло"),
//                                     Answer(answer: "Белокурый")],
//                            correctAnswer: 4)
//        case .six:
//            return Question(question: "Одним из направлений какой религиозной философии является учение дзен?",
//                            numberQuestion: .one,
//                            answer: [Answer(answer: "Даосизм"),
//                                     Answer(answer: "Буддизм"),
//                                     Answer(answer: "Индуизм"),
//                                     Answer(answer: "Иудаизм")],
//                            correctAnswer: 2)
//        case .seven:
//            return Question(question: "Какой рыболовной снастью ловил рыбу старик из сказки А.С. Пушкина \"Сказка о рыбаке и рыбке\"?",
//                            numberQuestion: .one,
//                            answer: [Answer(answer: "Удочкой"),
//                                     Answer(answer: "Невод"),
//                                     Answer(answer: "Бреднем"),
//                                     Answer(answer: "Сачком")],
//                            correctAnswer: 2)
        }
        
    }
}



