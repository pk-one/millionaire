//
//  AddQuestionViewController.swift
//  Millionaire
//
//  Created by Pavel Olegovich on 05.02.2022.
//

import Foundation
import UIKit


class AddQuestionViewController: UIViewController {

    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25)
        label.text = "Новый вопрос"
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.imageView?.contentMode = .scaleAspectFit
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .specialButton
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let questionTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.layer.cornerRadius = 10
        textView.clipsToBounds = true
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private let firstAnswerSwitch: UISwitch = {
        let randomSwitch = UISwitch()
        randomSwitch.onTintColor = .specialButton
        randomSwitch.addTarget(self, action: #selector(firstAnswerValueDidChange), for: .valueChanged)
        randomSwitch.translatesAutoresizingMaskIntoConstraints = false
        return randomSwitch
    }()
    
    private let firstAnswerTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 10
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.width))
        textField.leftViewMode = .always
        textField.clearButtonMode = .always
        textField.returnKeyType = .done
        textField.placeholder = "Первый ответ"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let secondAnswerSwitch: UISwitch = {
        let randomSwitch = UISwitch()
        randomSwitch.onTintColor = .specialButton
        randomSwitch.addTarget(self, action: #selector(secondAnswerValueDidChange), for: .valueChanged)
        randomSwitch.translatesAutoresizingMaskIntoConstraints = false
        return randomSwitch
    }()
    
    private let secondAnswerTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 10
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.width))
        textField.leftViewMode = .always
        textField.clearButtonMode = .always
        textField.returnKeyType = .done
        textField.placeholder = "Второй ответ"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let thirdAnswerSwitch: UISwitch = {
        let randomSwitch = UISwitch()
        randomSwitch.onTintColor = .specialButton
        randomSwitch.addTarget(self, action: #selector(thirdAnswerValueDidChange), for: .valueChanged)
        randomSwitch.translatesAutoresizingMaskIntoConstraints = false
        return randomSwitch
    }()
    
    private let thirdAnswerTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 10
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.width))
        textField.leftViewMode = .always
        textField.clearButtonMode = .always
        textField.returnKeyType = .done
        textField.placeholder = "Третий ответ"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let fourthAnswerSwitch: UISwitch = {
        let randomSwitch = UISwitch()
        randomSwitch.onTintColor = .specialButton
        randomSwitch.addTarget(self, action: #selector(fourthAnswerValueDidChange), for: .valueChanged)
        randomSwitch.translatesAutoresizingMaskIntoConstraints = false
        return randomSwitch
    }()
    
    private let fourthAnswerTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 10
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.width))
        textField.leftViewMode = .always
        textField.clearButtonMode = .always
        textField.returnKeyType = .done
        textField.placeholder = "Четвертый ответ"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let saveUserQuestionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Сохранить", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .specialButton
        button.titleLabel?.font = .systemFont(ofSize: 28)
        button.addTarget(self, action: #selector(saveUserQuestionTapped), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.addShadowOnView()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var stackView = UIStackView()
    private var pickerData = [String]()
    
    private var arraySwitch = [UISwitch]()
    
    private let userQuestionSaver = CaretakerUserQuestions()
    private let userQuestionBuilder = QuestionBuilder()
    
    private var isSwitch: Bool = false {
        didSet {
            arraySwitch.forEach { mySwitch in
                if mySwitch.isOn != isSwitch {
                    mySwitch.isEnabled = false
                    mySwitch.alpha = 0.8
                    saveUserQuestionButton.isEnabled = true
                    saveUserQuestionButton.alpha = 1.0
                } else {
                    mySwitch.isEnabled = true
                    mySwitch.alpha = 1.0
                    saveUserQuestionButton.isEnabled = false
                    saveUserQuestionButton.alpha = 0.8
                }
            }
        }
    }
    
    private var numberSwitchActive: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        closeButton.layer.cornerRadius = closeButton.frame.height / 2
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(titleLabel)
        view.addSubview(closeButton)
        view.addSubview(questionTextView)
        
        view.addSubview(firstAnswerSwitch)
        view.addSubview(firstAnswerTextField)
        
        view.addSubview(secondAnswerSwitch)
        view.addSubview(secondAnswerTextField)

        view.addSubview(thirdAnswerSwitch)
        view.addSubview(thirdAnswerTextField)

        view.addSubview(fourthAnswerSwitch)
        view.addSubview(fourthAnswerTextField)
        
        view.addSubview(saveUserQuestionButton)
        
        saveUserQuestionButton.isEnabled = false
        saveUserQuestionButton.alpha = 0.8
        
        arraySwitch = [firstAnswerSwitch,
                       secondAnswerSwitch,
                       thirdAnswerSwitch,
                       fourthAnswerSwitch]
    }
    
    private func setQuestion(questionString: String, answers: [(String, Bool)]) -> [Question] {
        userQuestionBuilder.setQuestion(questionString: questionString)
        
        answers.forEach { answer, isCorrect in
            userQuestionBuilder.setAnswers(answer: setAnswer(answer: answer, isCorrect: isCorrect) )
        }
        
        return userQuestionBuilder.buildQuestion()
    }
    
    private func setAnswer(answer: String, isCorrect: Bool) -> Answer {
        Answer(answer: answer, isCorrect: isCorrect)
    }
    
    
    @objc private func closeButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func firstAnswerValueDidChange() {
        isSwitch.toggle()
    }
    
    @objc private func secondAnswerValueDidChange() {
        isSwitch.toggle()
    }
    
    @objc private func thirdAnswerValueDidChange() {
        isSwitch.toggle()
        
    }
    @objc private func fourthAnswerValueDidChange() {
        isSwitch.toggle()
    }
    
    @objc private func saveUserQuestionTapped() {
        guard let questionText = questionTextView.text,
              let firstAnswerText = firstAnswerTextField.text,
              let secondAnswerText = secondAnswerTextField.text,
              let thirdAnswerText = thirdAnswerTextField.text,
              let fourthAnswerText = fourthAnswerTextField.text else { return }
        
        let question = setQuestion(questionString: questionText, answers: [(firstAnswerText, firstAnswerSwitch.isOn),
                                                                           (secondAnswerText, secondAnswerSwitch.isOn),
                                                                           (thirdAnswerText, thirdAnswerSwitch.isOn),
                                                                           (fourthAnswerText, fourthAnswerSwitch.isOn)])
              
        userQuestionSaver.save(question: question)
                
        dismiss(animated: true, completion: nil)
    }
    
   
}

//MARK: - setConstraints
extension AddQuestionViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant:  10),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        ])
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            closeButton.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            questionTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            questionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            questionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            questionTextView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        //first answer
        NSLayoutConstraint.activate([
            firstAnswerSwitch.centerYAnchor.constraint(equalTo: firstAnswerTextField.centerYAnchor),
            firstAnswerSwitch.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            firstAnswerTextField.topAnchor.constraint(equalTo: questionTextView.bottomAnchor, constant: 20),
            firstAnswerTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            firstAnswerTextField.leadingAnchor.constraint(equalTo: firstAnswerSwitch.trailingAnchor, constant: 10),
            firstAnswerTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
//
        //second answer
        NSLayoutConstraint.activate([
            secondAnswerSwitch.centerYAnchor.constraint(equalTo: secondAnswerTextField.centerYAnchor),
            secondAnswerSwitch.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ])

        NSLayoutConstraint.activate([
            secondAnswerTextField.topAnchor.constraint(equalTo: firstAnswerTextField.bottomAnchor, constant: 10),
            secondAnswerTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            secondAnswerTextField.leadingAnchor.constraint(equalTo: secondAnswerSwitch.trailingAnchor, constant: 10),
            secondAnswerTextField.heightAnchor.constraint(equalToConstant: 50)
        ])

        //third answer
        NSLayoutConstraint.activate([
            thirdAnswerSwitch.centerYAnchor.constraint(equalTo: thirdAnswerTextField.centerYAnchor),
            thirdAnswerSwitch.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ])

        NSLayoutConstraint.activate([
            thirdAnswerTextField.topAnchor.constraint(equalTo: secondAnswerTextField.bottomAnchor, constant: 10),
            thirdAnswerTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            thirdAnswerTextField.leadingAnchor.constraint(equalTo: thirdAnswerSwitch.trailingAnchor, constant: 10),
            thirdAnswerTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
//
        //fourth answer
        NSLayoutConstraint.activate([
            fourthAnswerSwitch.centerYAnchor.constraint(equalTo: fourthAnswerTextField.centerYAnchor),
            fourthAnswerSwitch.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ])

        NSLayoutConstraint.activate([
            fourthAnswerTextField.topAnchor.constraint(equalTo: thirdAnswerTextField.bottomAnchor, constant: 10),
            fourthAnswerTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            fourthAnswerTextField.leadingAnchor.constraint(equalTo: fourthAnswerSwitch.trailingAnchor, constant: 10),
            fourthAnswerTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            saveUserQuestionButton.topAnchor.constraint(equalTo: fourthAnswerTextField.bottomAnchor, constant: 20),
            saveUserQuestionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            saveUserQuestionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            saveUserQuestionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
