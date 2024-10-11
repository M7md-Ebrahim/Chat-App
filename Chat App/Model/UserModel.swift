//
//  UserModel.swift
//  Chat App
//
//  Created by M7md  on 11/10/2024.
//

struct UserModel {
    let firstName : String
    let lastName : String
    let email : String
    var safeEmail : String {
        var safeEmail = email.replacingOccurrences(of: ".", with: "-")
        return safeEmail.replacingOccurrences(of: "@", with: "-")
    }
}
