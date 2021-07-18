//
//  ColorButton.swift
//  Lesson11
//
//  Created by Никита Чирухин on 18.07.2021.
//

import UIKit

class ColorButton: UIView {
    
    let redButton: UIButton = {
        
        let redButton = UIButton()
        
        redButton.addTarget(self, action: #selector(changeBackGroundColor), for: .touchUpInside)
        redButton.translatesAutoresizingMaskIntoConstraints = false
        redButton.backgroundColor = .red
        redButton.layer.cornerRadius = 30
        redButton.layer.borderColor = UIColor.black.cgColor
        redButton.layer.borderWidth = 5
        
        return redButton
    }()
    
    let blueButton: UIButton = {
        
        let blueButton = UIButton()
        
        
        blueButton.addTarget(self, action: #selector(changeBackGroundColor), for: .touchUpInside)
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.backgroundColor = .blue
        blueButton.layer.cornerRadius = 30
        blueButton.layer.borderColor = UIColor.black.cgColor
        blueButton.layer.borderWidth = 5
        
        return blueButton
    }()
    
    let yellowButton: UIButton = {
        
        let yellowButton = UIButton()
        
        yellowButton.addTarget(self, action: #selector(changeBackGroundColor), for: .touchUpInside)
        yellowButton.translatesAutoresizingMaskIntoConstraints = false
        yellowButton.backgroundColor = .yellow
        yellowButton.layer.cornerRadius = 30
        yellowButton.layer.borderColor = UIColor.black.cgColor
        yellowButton.layer.borderWidth = 5
        
        return yellowButton
    }()
    
    let greenButton: UIButton = {
        
        let greenButton = UIButton()
        
        greenButton.addTarget(self, action: #selector(changeBackGroundColor), for: .touchUpInside)
        greenButton.translatesAutoresizingMaskIntoConstraints = false
        greenButton.backgroundColor = .green
        greenButton.layer.cornerRadius = 30
        greenButton.layer.borderColor = UIColor.black.cgColor
        greenButton.layer.borderWidth = 5
        
        return greenButton
    }()
    
    lazy var stackView: UIStackView = {
        
        let stack = UIStackView()
        
        stack.axis = .vertical
        stack.spacing = 20.0
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    private func setupView() {
        
        let buttons = [redButton, blueButton, yellowButton, greenButton]
        backgroundColor = .gray
        buttons.forEach { stackView.addArrangedSubview($0) }
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 300),
            stackView.heightAnchor.constraint(equalToConstant: 500)
        ])
    }
    
    @objc func changeBackGroundColor(sender: UIButton) {
    
        backgroundColor = sender.backgroundColor
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
