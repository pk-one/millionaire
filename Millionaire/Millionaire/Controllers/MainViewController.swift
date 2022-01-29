//
//  ViewController.swift
//  Millionaire
//
//  Created by Pavel Olegovich on 28.01.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let startGameButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Играть", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .specialButton
        button.titleLabel?.font = .systemFont(ofSize: 28)
        button.addTarget(self, action: #selector(startGameTapped), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.addShadowOnView()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let resultsGameButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Результаты", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .specialButton
        button.titleLabel?.font = .systemFont(ofSize: 28)
        button.addTarget(self, action: #selector(resultsGameTapped), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.addShadowOnView()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
    }

    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(logoImageView)
        
        stackView = UIStackView(arrangedSubviews: [startGameButton,
                                                  resultsGameButton],
                                axis: .vertical,
                                spacing: 20,
                                distribution: .fillProportionally)
        
        view.addSubview(stackView)
    }
    
    @objc private func startGameTapped() {
        let gameVC = GameViewController()
        gameVC.modalPresentationStyle = .fullScreen
        present(gameVC, animated: true)
    }
    
    @objc private func resultsGameTapped() {
        let resultsVC = ResultsGameViewController()
        resultsVC.modalPresentationStyle = .fullScreen
        present(resultsVC, animated: true)
    }
}

//MARK: - setConstraints
extension MainViewController {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            startGameButton.widthAnchor.constraint(equalToConstant: 250)
        ])
    }
}
