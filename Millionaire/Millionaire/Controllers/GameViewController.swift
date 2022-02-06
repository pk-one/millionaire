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
        button.layer.cornerRadius = 10
        button.addShadowOnView()
        button.tag = 4
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var firstStackView = UIStackView()
    private var secondStackView = UIStackView()
    private var stackView = UIStackView()
    
    private var allQuestionArray: [Question]?
    private var currentQuestionArray: [Question]?
    
    private var numberQuestion = 0
    
    weak var delegate: GameViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
        checkStrategy()
        setupQuestion(question: allQuestionArray?.first)
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
    
    private func checkStrategy() {
        guard let isActive = Game.shared.isActiveRandom else { return }
        if isActive {
            let chooser = StrategyChooser(strategy: RandomQuestions())
            allQuestionArray = chooser.getQuestions()
            currentQuestionArray = allQuestionArray
        } else {
            let chooser = StrategyChooser(strategy: ConsecutiveQuestions())
            allQuestionArray = chooser.getQuestions()
            currentQuestionArray = allQuestionArray
        }
    }
    
    private func generateNumberQuestion() {
        if !(currentQuestionArray?.isEmpty ?? false) {
            numberQuestion += 1
        } else {
            createAlertOk(title: "Поздравляем", message: "Вы ответили на все \(numberQuestion) вопросов и победили в игре!!!") { [self] in
                self.delegate?.didEndGame(with: GameSession(countQuestion: allQuestionArray?.count ?? 0,
                                                            countCorrectQuestions: numberQuestion))
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    private func setupQuestion(question: Question?) {
        
        generateNumberQuestion()
        
        guard let question = question else { return }
        let buttonsArray = [firstAnswerButton,
                           secondAnswerButton,
                           thirdAnswerButton,
                           fourthAnswerButton]
        numberOfQuestionLabel.text = "Вопрос \(numberQuestion)"
        questionTextLabel.text = question.question
        buttonsArray.forEach { $0.addTarget(self, action: #selector(answerTapped(sender:)), for: .touchUpInside) }
        for (button, answer) in zip(buttonsArray, question.answer) {
            button.setTitle(answer.answer, for: .normal)
            button.tag = answer.isCorrect ? 1 : 0
        }
    }
    
    @objc private func answerTapped(sender: UIButton) {
    
        if sender.tag == 1 {
            DispatchQueue.main.async { [self] in
                self.setupQuestion(question: currentQuestionArray?.first)
            }
        currentQuestionArray?.removeFirst()
        } else {
            createAlertOk(title: "Проигрыш", message: "Вы ответили на \(numberQuestion - 1) вопросов.") { [self] in
                self.delegate?.didEndGame(with: GameSession(countQuestion: allQuestionArray?.count ?? 0,
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
