//
//  GameViewController.swift
//  Millionaire
//
//  Created by Pavel Olegovich on 28.01.2022.
//

import Foundation
import UIKit

protocol GameViewControllerDelegate: AnyObject {
    func didEndGame(with result: GameSession)
}

class GameViewController: UIViewController {
    
    private let questionBackgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let numberOfQuestionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.text = "Вопрос: 1"
        label.textAlignment = .center
        label.textColor = .specialButton
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let questionTextLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.textColor = .specialButton
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let firstAnswerButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .specialButton
        button.backgroundColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.addTarget(self, action: #selector(answerTapped), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.addShadowOnView()
        button.tag = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let secondAnswerButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .specialButton
        button.backgroundColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.addTarget(self, action: #selector(answerTapped), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.addShadowOnView()
        button.tag = 2
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let thirdAnswerButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .specialButton
        button.backgroundColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.addTarget(self, action: #selector(answerTapped), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.addShadowOnView()
        button.tag = 3
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let fourthAnswerButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .specialButton
        button.backgroundColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.addTarget(self, action: #selector(answerTapped), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.addShadowOnView()
        button.tag = 4
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var firstStackView = UIStackView()
    private var secondStackView = UIStackView()
    private var stackView = UIStackView()
    
    private var currentQuestion: Question?
    
    private let countQuestion = NumberQuestion.allCases.count //берем кол-во вопросов из енама
    private var countQuestionArray = [Int]()
    
    private var numberQuestion = 0
    
    weak var delegate: GameViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countQuestionArray  = Array(1...countQuestion) //делаем массив по кол-ву вопросов
        setupViews()
        setConstraints()
        setupQuestion()
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        view.addSubview(questionBackgroundView)
        questionBackgroundView.addSubview(numberOfQuestionLabel)
        questionBackgroundView.addSubview(questionTextLabel)
        
        firstStackView = UIStackView(arrangedSubviews: [firstAnswerButton,
                                                       secondAnswerButton],
                                     axis: .horizontal,
                                     spacing: 10,
                                     distribution: .fillEqually)
        
        secondStackView = UIStackView(arrangedSubviews: [thirdAnswerButton,
                                                        fourthAnswerButton],
                                      axis: .horizontal,
                                      spacing: 10,
                                      distribution: .fillEqually)
        
        stackView = UIStackView(arrangedSubviews: [firstStackView,
                                                  secondStackView],
                                axis: .vertical,
                                spacing: 10,
                                distribution: .fillEqually)
        
        view.addSubview(stackView)
    }
    
    private func generateQuestion() {
        if !countQuestionArray.isEmpty {
            let randomIndex = Int(arc4random_uniform(UInt32(countQuestionArray.count)))
            let randomNumber = countQuestionArray[randomIndex]
            countQuestionArray.remove(at: randomIndex)
        
            let randomNumberQuestion = generateRandomNumberQuestion(number: randomNumber) // генерируем вопрос по рандомному числу
            
            let question = Question.getQuestion(with: randomNumberQuestion) // получаем вопрос
            numberQuestion += 1
            currentQuestion = question
        } else {
            createAlertOk(title: "Поздравляем", message: "Вы ответили на все \(numberQuestion) вопросов и победили в игре!!!") { [self] in
                self.delegate?.didEndGame(with: GameSession(countQuestion: countQuestion,
                                                            countCorrectQuestions: numberQuestion))
                self.dismiss(animated: true, completion: nil)
            }
        }
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
    
    private func setupQuestion() {
        generateQuestion()
        
        guard let question = currentQuestion?.question,
            let firstAnswer = currentQuestion?.answer[0].answer,
            let secondAnswer = currentQuestion?.answer[1].answer,
            let thirdAnswer = currentQuestion?.answer[2].answer,
            let fourthAnswer = currentQuestion?.answer[3].answer else { return }
        
        numberOfQuestionLabel.text = "Вопрос \(numberQuestion)"
        questionTextLabel.text = question
        firstAnswerButton.setTitle("\(firstAnswer)", for: .normal)
        secondAnswerButton.setTitle("\(secondAnswer)", for: .normal)
        thirdAnswerButton.setTitle("\(thirdAnswer)", for: .normal)
        fourthAnswerButton.setTitle("\(fourthAnswer)", for: .normal)
    }
    
    @objc private func answerTapped(sender: UIButton) {
        
        let correctAnswer = currentQuestion?.correctAnswer
        
        if sender.tag == correctAnswer {
            DispatchQueue.main.async {
                self.setupQuestion()
            }
        } else {
            createAlertOk(title: "Проигрыш", message: "Вы ответили на \(numberQuestion - 1) вопросов.") { [self] in
                self.delegate?.didEndGame(with: GameSession(countQuestion: countQuestion,
                                                            countCorrectQuestions: numberQuestion - 1))
                dismiss(animated: true, completion: nil)
            }
        }
    }
}


//MARK: - setConstraints
extension GameViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            questionBackgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            questionBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            questionBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            questionBackgroundView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
        ])
        
        NSLayoutConstraint.activate([
            numberOfQuestionLabel.topAnchor.constraint(equalTo: questionBackgroundView.topAnchor, constant: 10),
            numberOfQuestionLabel.leadingAnchor.constraint(equalTo: questionBackgroundView.leadingAnchor, constant: 10),
            numberOfQuestionLabel.trailingAnchor.constraint(equalTo: questionBackgroundView.trailingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            questionTextLabel.topAnchor.constraint(equalTo: numberOfQuestionLabel.bottomAnchor, constant: 20),
            questionTextLabel.leadingAnchor.constraint(equalTo: questionBackgroundView.leadingAnchor, constant: 10),
            questionTextLabel.trailingAnchor.constraint(equalTo: questionBackgroundView.trailingAnchor, constant: -10),
            
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: questionBackgroundView.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ])
    }
}
