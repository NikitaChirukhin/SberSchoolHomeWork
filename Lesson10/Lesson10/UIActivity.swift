//
//  UIActivity.swift
//  Lesson10
//
//  Created by Никита Чирухин on 18.07.2021.
//

import UIKit

class UICustomActivity: UIActivity {
    
    var _activityTitle: String
    var activityItems = [Any]()
    var action: ([Any]) -> Void
    override var activityTitle: String? {
        return _activityTitle
    }
    
    override var activityType: UIActivity.ActivityType? {
        return UIActivity.ActivityType(rawValue: "MyActivity")
    }
    
    override class var activityCategory: UIActivity.Category {
        return .action
    }
    
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        return true
    }
    
    override func prepare(withActivityItems activityItems: [Any]) {
        self.activityItems = activityItems
    }
    
    override func perform() {
        action(activityItems)
        activityDidFinish(true)
    }

    init(title: String, performAction: @escaping ([Any]) -> Void) {

            _activityTitle = title

            action = performAction

            super.init()

        }

}
