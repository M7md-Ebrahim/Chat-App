//
//  ViewController.swift
//  Chat App
//
//  Created by M7md  on 22/05/2024.
//

import UIKit

class ConversationsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let loggedIn = UserDefaults.standard.bool(forKey: Constants.loginKey)
        let viewController = loggedIn ? RegisterViewController() : LoginViewController()
        let nav = UINavigationController(rootViewController: viewController)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: false)
    }
}
