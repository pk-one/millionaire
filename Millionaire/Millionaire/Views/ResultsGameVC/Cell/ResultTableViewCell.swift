//
//  ResultTableViewCell.swift
//  Millionaire
//
//  Created by Pavel Olegovich on 28.01.2022.
//

import Foundation
import UIKit

class ResultTableViewCell: UITableViewCell {
    
    private let cellBackgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let totalQuestionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.text = "Всего вопросов в игре: 10"
        label.textColor = .specialButton
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let totalСorrectAnswersLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.text = "Всего правильных ответов: 7"
        label.textColor = .specialButton
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let totalWinMoneyLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.text = "Выигрыш: 100000"
        label.textColor = .specialButton
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .clear
        selectionStyle = .none
        
        addSubview(cellBackgroundView)
        cellBackgroundView.addSubview(totalWinMoneyLabel)
        cellBackgroundView.addSubview(totalQuestionLabel)
        cellBackgroundView.addSubview(totalСorrectAnswersLabel)
       
    }
}



//MARK: - setConstraints
extension ResultTableViewCell {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            cellBackgroundView.topAnchor.constraint(equalTo: topAnchor, constant:  10),
            cellBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            cellBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        
        NSLayoutConstraint.activate([
            totalWinMoneyLabel.topAnchor.constraint(equalTo: cellBackgroundView.topAnchor, constant: 10),
            totalWinMoneyLabel.leadingAnchor.constraint(equalTo: cellBackgroundView.leadingAnchor, constant: 10),
            totalWinMoneyLabel.trailingAnchor.constraint(equalTo: cellBackgroundView.trailingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            totalQuestionLabel.topAnchor.constraint(equalTo: totalWinMoneyLabel.bottomAnchor, constant: 10),
            totalQuestionLabel.leadingAnchor.constraint(equalTo: cellBackgroundView.leadingAnchor, constant: 10),
            totalQuestionLabel.trailingAnchor.constraint(equalTo: cellBackgroundView.trailingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            totalСorrectAnswersLabel.topAnchor.constraint(equalTo: totalQuestionLabel.bottomAnchor, constant: 10),
            totalСorrectAnswersLabel.leadingAnchor.constraint(equalTo: cellBackgroundView.leadingAnchor, constant: 10),
            totalСorrectAnswersLabel.trailingAnchor.constraint(equalTo: cellBackgroundView.trailingAnchor, constant: -10),
            totalСorrectAnswersLabel.bottomAnchor.constraint(equalTo: cellBackgroundView.bottomAnchor, constant: -10)
        ])
    }
}
