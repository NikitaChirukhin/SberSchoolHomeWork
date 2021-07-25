//
//  AnimationElements.swift
//  Lesson13
//
//  Created by Никита Чирухин on 25.07.2021.
//

import UIKit

class AnimationElements: UIView {
    
    let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "mosc"), for: UIControl.State.normal)
        button.layer.removeAllAnimations()
        button.layer.removeAnimation(forKey: "Nikita")
        button.addTarget(self, action: #selector(buttonPressed), for: .allEvents)
        return button
    }()
    
    let imageView: UIImageView = {
        var imageView = UIImageView(image: #imageLiteral(resourceName: "table"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    func setupView(){
        
        addSubview(imageView)
        addSubview(button)
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.widthAnchor.constraint(equalTo: widthAnchor),
            imageView.heightAnchor.constraint(equalTo: heightAnchor),
            button.centerXAnchor.constraint(equalTo: centerXAnchor),
            button.centerYAnchor.constraint(equalTo: centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 50),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func buttonPressed() {
        
        let maxWidth = Int(self.frame.width)
        let maxHeight = Int(self.frame.height)
        let x = Int.random(in: 0...maxWidth)
        let y = Int.random(in: 0...maxHeight)
        
        UIView.animate(withDuration: 0.5){
            self.button.center = CGPoint(x: x, y: y)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
