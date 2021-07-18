//
//  ViewController.swift
//  Lesson11
//
//  Created by Никита Чирухин on 18.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let button = ColorButton()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupView()
    }
    
    
    private func setupView() {
        
        
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalTo: view.widthAnchor),
            button.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }
}


