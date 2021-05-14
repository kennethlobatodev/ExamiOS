//
//  BaseViewController.swift
//  ExameniOS
//
//  Created by Kenneth on 13/05/21.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        dismissTapKeyboard()
        disableDarkMode()
    }
    
    func dismissTapKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    func disableDarkMode() {
        overrideUserInterfaceStyle = .light
    }

}
