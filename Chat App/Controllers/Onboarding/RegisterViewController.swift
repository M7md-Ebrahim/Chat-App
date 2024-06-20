//
//  RegisterViewController.swift
//  Chat App
//
//  Created by M7md  on 23/05/2024.
//

import UIKit

class RegisterViewController: UIViewController {
    private let imv: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "logo")
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Create Account"
    }
}
