//
//  ResultsGameViewController.swift
//  Millionaire
//
//  Created by Pavel Olegovich on 28.01.2022.
//

import Foundation
import UIKit

class ResultsGameViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25)
        label.text = "Результаты"
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
    
    private let resultsTableView: UITableView = {
        let tableView = UITableView()
        tableView.bounces = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ResultTableViewCell.self, forCellReuseIdentifier: "ResultTableViewCell")
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        setDelegates()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        closeButton.layer.cornerRadius = closeButton.frame.height / 2
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        view.addSubview(titleLabel)
        view.addSubview(closeButton)
        view.addSubview(resultsTableView)
    }
    
    
    private func setDelegates() {
        resultsTableView.dataSource = self
    }
    
    @objc private func closeButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
}


//MARK: - UITableViewDataSource
extension ResultsGameViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Game.shared.gameResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ResultTableViewCell", for: indexPath) as? ResultTableViewCell else { return UITableViewCell() }
        
        let result = Game.shared.gameResults[indexPath.row]
        
        cell.configure(result: result)
        
        return cell
    }
}

//MARK: - setConstraints
extension ResultsGameViewController {
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
            resultsTableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant:  10),
            resultsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            resultsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            resultsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
