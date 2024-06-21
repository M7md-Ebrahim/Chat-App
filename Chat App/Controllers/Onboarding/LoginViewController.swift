//
//  LoginViewController.swift
//  Chat App
//
//  Created by M7md  on 23/05/2024.
//

import UIKit

class LoginViewController: UIViewController {
    private let loginScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    private let chatImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: Constants.chatIcon)
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.layer.borderColor = UIColor.label.cgColor
        textField.backgroundColor = .systemBackground
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 12
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        textField.rightViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.returnKeyType = .continue
        return textField
    }()
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.layer.borderColor = UIColor.label.cgColor
        textField.backgroundColor = .systemBackground
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 12
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        textField.rightViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.returnKeyType = .done
        textField.isSecureTextEntry = true
        return textField
    }()
    private let loginButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Log In", for: .normal)
        btn.backgroundColor = .label
        btn.tintColor = .systemBackground
        btn.layer.cornerRadius = 12
        btn.layer.masksToBounds = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Login"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Register", style: .done, target: self, action: #selector(register))
        navigationController?.navigationBar.tintColor = .label
        view.addSubview(loginScrollView)
        loginScrollView.addSubview(chatImageView)
        loginScrollView.addSubview(emailTextField)
        loginScrollView.addSubview(passwordTextField)
        loginScrollView.addSubview(loginButton)
        applyConstraints()
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        loginScrollView.frame = view.bounds
    }
    @objc private func register() {
        let registerViewController = RegisterViewController()
        navigationController?.pushViewController(registerViewController, animated: true)
    }
    @objc private func loginTapped() {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        guard let email = emailTextField.text, let password = passwordTextField.text, !email.isEmpty, !password.isEmpty, password.count >= 6 else {
            loginError()
            return
        }
        print("Done")
    }
    private func loginError() {
        let alert = UIAlertController(title: "Error", message: "Incorrect email or password", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
        present(alert, animated: true)
    }
    private func applyConstraints() {
        NSLayoutConstraint.activate([
            chatImageView.topAnchor.constraint(equalTo: loginScrollView.topAnchor, constant: 60),
            chatImageView.centerXAnchor.constraint(equalTo: loginScrollView.centerXAnchor),
            chatImageView.heightAnchor.constraint(equalToConstant: 200),
            chatImageView.widthAnchor.constraint(equalTo: loginScrollView.widthAnchor, multiplier: 0.3),
            emailTextField.topAnchor.constraint(equalTo: chatImageView.bottomAnchor, constant: 10),
            emailTextField.centerXAnchor.constraint(equalTo: loginScrollView.centerXAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            emailTextField.widthAnchor.constraint(equalTo: loginScrollView.widthAnchor, multiplier: 0.8),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            passwordTextField.centerXAnchor.constraint(equalTo: loginScrollView.centerXAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.widthAnchor.constraint(equalTo: loginScrollView.widthAnchor, multiplier: 0.8),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            loginButton.centerXAnchor.constraint(equalTo: loginScrollView.centerXAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.widthAnchor.constraint(equalTo: loginScrollView.widthAnchor, multiplier: 0.8)
        ])
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            loginTapped()
        }
        return true
    }
}
