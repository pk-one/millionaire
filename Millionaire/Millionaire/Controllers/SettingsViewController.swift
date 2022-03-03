//
//  SettingsViewController.swift
//  Millionaire
//
//  Created by Pavel Olegovich on 05.02.2022.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25)
        label.text = "Настройки"
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
    
    private let randomQuestionsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25)
        label.text = "Рандомные вопросы:"
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
 
    private let randomQuestionsSwitch: UISwitch = {
        let randomSwitch = UISwitch()
        randomSwitch.onTintColor = .specialButton
        randomSwitch.addTarget(self, action: #selector(switchValueDidChange), for: .valueChanged)
        randomSwitch.translatesAutoresizingMaskIntoConstraints = false
        return randomSwitch
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
        checkIsOn()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        closeButton.layer.cornerRadius = closeButton.frame.height / 2
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(titleLabel)
        view.addSubview(closeButton)
        view.addSubview(randomQuestionsLabel)
        view.addSubview(randomQuestionsSwitch)
    }
    
    private func checkIsOn() {
        guard let isActiveRandom = Game.shared.isActiveRandom else { return }
        if isActiveRandom {
            randomQuestionsSwitch.setOn(true, animated: true)
        } else {
            randomQuestionsSwitch.setOn(false, animated: true)
        }
    }
    
    @objc func switchValueDidChange(sender: UISwitch) {
        Game.shared.toggleIsActive()
    }
    
    @objc private func closeButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}


//MARK: - setConstraints
extension SettingsViewController {
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
            randomQuestionsLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            randomQuestionsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
        ])
        
        NSLayoutConstraint.activate([
            randomQuestionsSwitch.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            randomQuestionsSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
}
