//
//  ViewController.swift
//  Millionaire
//
//  Created by Pavel Olegovich on 28.01.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private let startGameButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Играть", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 28)
        button.addTarget(self, action: #selector(startGameTapped), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let resultsGameButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Результаты", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 28)
        button.addTarget(self, action: #selector(resultsGameTapped), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    private func setupViews() {
        view.backgroundColor = .red
        
        view.addSubview(startGameButton)
        view.addSubview(resultsGameButton)
    }
    
    @objc private func startGameTapped() {
        
    }
    
    @objc private func resultsGameTapped() {
        
    }

}

