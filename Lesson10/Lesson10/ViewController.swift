//
//  ViewController.swift
//  Lesson10
//
//  Created by Никита Чирухин on 17.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let button: UIButton = {
        
        let button = UIButton()
        button.backgroundColor = .brown
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 3
        button.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        return button
    }()

    let activityViewController: UIActivityViewController = {
        
        let items = ["My App"]
        
        let customItem = UICustomActivity(title: "Custom") { sharedItem in
            guard let sharedString = sharedItem as? [String] else { return }
            for str in sharedString {
                print("Custom activity working")
            }
        }
        
        let activityViewController = UIActivityViewController(activityItems: items, applicationActivities: [customItem])
        activityViewController.excludedActivityTypes = [UIActivity.ActivityType.postToFlickr,   UIActivity.ActivityType.postToVimeo, UIActivity.ActivityType.saveToCameraRoll]
        
        var activityTitle: String? {
            return "Copy Link"
        }
        
        return activityViewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        view.backgroundColor = .blue
    }
    
    func setupView() {
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func buttonTap() {
        
        present(activityViewController, animated: true)
    }
}

