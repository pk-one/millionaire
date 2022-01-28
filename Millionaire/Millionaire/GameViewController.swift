//
//  GameViewController.swift
//  Millionaire
//
//  Created by Pavel Olegovich on 28.01.2022.
//

import Foundation
import UIKit

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
        label.text = "В каком году, Юрий Гагарин полетел в космос?"
        label.numberOfLines = 0
        label.textColor = .specialButton
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    private let firstAnswerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Первый ответ", for: .normal)
        button.tintColor = .specialButton
        button.backgroundColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.addTarget(self, action: #selector(firstAnswerTapped), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.addShadowOnView()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let secondAnswerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Второй ответ", for: .normal)
        button.tintColor = .specialButton
        button.backgroundColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.addTarget(self, action: #selector(secondAnswerTapped), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.addShadowOnView()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let thirdAnswerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Третий ответ", for: .normal)
        button.tintColor = .specialButton
        button.backgroundColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.addTarget(self, action: #selector(thirdAnswerTapped), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.addShadowOnView()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let fourthAnswerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Четвертый ответ", for: .normal)
        button.tintColor = .specialButton
        button.backgroundColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.addTarget(self, action: #selector(fourthAnswerTapped), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.addShadowOnView()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var firstStackView = UIStackView()
    private var secondStackView = UIStackView()
    private var stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
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
    
    @objc private func firstAnswerTapped() {
        
    }
    
    @objc private func secondAnswerTapped() {
        
    }
    
    @objc private func thirdAnswerTapped() {
        
    }
    
    @objc private func fourthAnswerTapped() {
        
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
//            stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)
        ])
    }
}


//MARK: - SwiftUI
import SwiftUI

struct GameVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let gameVC = GameViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<GameVCProvider.ContainerView>) -> GameViewController {
            return gameVC
        }
        
        func updateUIViewController(_ uiViewController: GameVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<GameVCProvider.ContainerView>) {
            
        }
    }
}
