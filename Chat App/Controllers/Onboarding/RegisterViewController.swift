//
//  RegisterViewController.swift
//  Chat App
//
//  Created by M7md  on 23/05/2024.
//

import UIKit

class RegisterViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Register"
    }
    @objc func register() {
        let loginViewController = RegisterViewController()
        navigationController?.pushViewController(loginViewController, animated: true)
    }
}
