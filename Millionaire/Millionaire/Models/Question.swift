//
//  Question.swift
//  Millionaire
//
//  Created by Pavel Olegovich on 28.01.2022.
//

import Foundation

struct Answer: Codable {
    let answer: String
    let isCorrect: Bool
}

struct Question: Codable {
    let question: String
    let answer: [Answer]
    
    static var getQuestion: [Question] {
        [Question(question: "На вершине какой горы расположена сорокаметровая статуя Христа, являющаяся символом Рио-де-Жанейро?",
                  answer: [Answer(answer: "Тупунгато", isCorrect: false),
                           Answer(answer: "Корковадо", isCorrect: true),
                           Answer(answer: "Уаскаран", isCorrect: false),
                           Answer(answer: "Ильимани", isCorrect: false)]),
         Question(question: "Какое брюхо, согласно спорной русской пословице, глухо к ученью?",
                  answer: [Answer(answer: "Сытое", isCorrect: true),
                           Answer(answer: "Толстое", isCorrect: false),
                           Answer(answer: "Тощее", isCorrect: false),
                           Answer(answer: "Пустое", isCorrect: false)]),
         Question(question: "Какая из этих кислот является витамином?",
                  answer: [Answer(answer: "Молочная", isCorrect: false),
                           Answer(answer: "Янтарная", isCorrect: false),
                           Answer(answer: "Яблочная", isCorrect: false),
                           Answer(answer: "Никотиновая", isCorrect: true)]),
         Question(question: "Кто является чемпионом гонок 'Формулы-1' 1998-99 г.г.?",
                  answer: [Answer(answer: "Шумахер", isCorrect: false),
                           Answer(answer: "Хаккинен", isCorrect: true),
                           Answer(answer: "Барикелло", isCorrect: false),
                           Answer(answer: "Кулхард", isCorrect: false)]),
         Question(question: "Какой цвет волос был у возлюбленной Тристана Изольды, если верить Бедье?",
                  answer: [Answer(answer: "Каштановый", isCorrect: false),
                           Answer(answer: "Рыжий", isCorrect: false),
                           Answer(answer: "Вороново крыло", isCorrect: false),
                           Answer(answer: "Белокурый", isCorrect: true)]),
         Question(question: "Одним из направлений какой религиозной философии является учение дзен?",
                  answer: [Answer(answer: "Даосизм", isCorrect: false),
                           Answer(answer: "Буддизм", isCorrect: true),
                           Answer(answer: "Индуизм", isCorrect: false),
                           Answer(answer: "Иудаизм", isCorrect: false)]),
         Question(question: "Какой рыболовной снастью ловил рыбу старик из сказки А.С. Пушкина \"Сказка о рыбаке и рыбке\"?",
                  answer: [Answer(answer: "Удочкой", isCorrect: false),
                           Answer(answer: "Невод", isCorrect: true),
                           Answer(answer: "Бреднем", isCorrect: false),
                           Answer(answer: "Сачком", isCorrect: false)])]
    }
}




