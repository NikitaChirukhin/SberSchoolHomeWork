//
//  ViewController.swift
//  Lesson13
//
//  Created by Никита Чирухин on 25.07.2021.
//

import UIKit

class ViewController: UIViewController {

    var animation = AnimationElements()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        
        animation.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animation)
        NSLayoutConstraint.activate([
            animation.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animation.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            animation.widthAnchor.constraint(equalTo: view.widthAnchor),
            animation.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }
}

