//
//  RegisterViewController.swift
//  Chat App
//
//  Created by M7md  on 23/05/2024.
//

import UIKit

class RegisterViewController: UIViewController {
    private let registerScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(systemName: Constants.profileImage)
        imageView.tintColor = .label
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
    private let firstNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "First Name"
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
    private let lastNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Last Name"
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
    private let registerButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Register", for: .normal)
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
        title = "Create Account"
        navigationController?.navigationBar.tintColor = .label
        view.addSubview(registerScrollView)
        registerScrollView.addSubview(profileImageView)
        registerScrollView.addSubview(emailTextField)
        registerScrollView.addSubview(passwordTextField)
        registerScrollView.addSubview(firstNameTextField)
        registerScrollView.addSubview(lastNameTextField)
        registerScrollView.addSubview(registerButton)
        applyConstraints()
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        emailTextField.delegate = self
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        passwordTextField.delegate = self
        profileImageGesture()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        registerScrollView.frame = view.bounds
    }
    @objc private func registerButtonTapped() {
        emailTextField.resignFirstResponder()
        firstNameTextField.resignFirstResponder()
        lastNameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        guard let email = emailTextField.text, let firstName = firstNameTextField.text, let lastName = lastNameTextField.text, let password = passwordTextField.text,
            !email.isEmpty, !firstName.isEmpty, !lastName.isEmpty, !password.isEmpty, password.count >= 6 else {
            loginError()
            return
        }
        print("Done")
    }
    private func loginError() {
        let alert = UIAlertController(title: "Error", message: "Incorrect Info", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
        present(alert, animated: true)
    }
    private func applyConstraints() {
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: registerScrollView.topAnchor, constant: 60),
            profileImageView.centerXAnchor.constraint(equalTo: registerScrollView.centerXAnchor),
            profileImageView.heightAnchor.constraint(equalToConstant: 200),
            profileImageView.widthAnchor.constraint(equalTo: registerScrollView.widthAnchor, multiplier: 0.4),
            emailTextField.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 5),
            emailTextField.centerXAnchor.constraint(equalTo: registerScrollView.centerXAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            emailTextField.widthAnchor.constraint(equalTo: registerScrollView.widthAnchor, multiplier: 0.8),
            firstNameTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            firstNameTextField.centerXAnchor.constraint(equalTo: registerScrollView.centerXAnchor),
            firstNameTextField.heightAnchor.constraint(equalToConstant: 50),
            firstNameTextField.widthAnchor.constraint(equalTo: registerScrollView.widthAnchor, multiplier: 0.8),
            lastNameTextField.topAnchor.constraint(equalTo: firstNameTextField.bottomAnchor, constant: 10),
            lastNameTextField.centerXAnchor.constraint(equalTo: registerScrollView.centerXAnchor),
            lastNameTextField.heightAnchor.constraint(equalToConstant: 50),
            lastNameTextField.widthAnchor.constraint(equalTo: registerScrollView.widthAnchor, multiplier: 0.8),
            passwordTextField.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor, constant: 10),
            passwordTextField.centerXAnchor.constraint(equalTo: registerScrollView.centerXAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.widthAnchor.constraint(equalTo: registerScrollView.widthAnchor, multiplier: 0.8),
            registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            registerButton.centerXAnchor.constraint(equalTo: registerScrollView.centerXAnchor),
            registerButton.heightAnchor.constraint(equalToConstant: 50),
            registerButton.widthAnchor.constraint(equalTo: registerScrollView.widthAnchor, multiplier: 0.8)
        ])
    }
    private func profileImageGesture() {
        registerScrollView.isUserInteractionEnabled = true
        profileImageView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(profileImagePick))
        profileImageView.addGestureRecognizer(gesture)
    }
    @objc private func profileImagePick() {
        print("Photo chenaged")
    }
}

extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            firstNameTextField.becomeFirstResponder()
        } else if textField == firstNameTextField {
            lastNameTextField.becomeFirstResponder()
        } else if textField == lastNameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            registerButtonTapped() }
        return true
    }
}
