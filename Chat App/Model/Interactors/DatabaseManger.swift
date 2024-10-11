//
//  DatabaseManger.swift
//  Chat App
//
//  Created by M7md  on 11/10/2024.
//

import Foundation
import FirebaseDatabase

final class DatabaseManger {
    static let shared = DatabaseManger()
    private let database = Database.database().reference()
    public func insertUser(_ user: UserModel) {
        database.child(user.safeEmail).setValue(["First_Name":user.firstName, "Last_Name":user.lastName])
    }
    public func userExists(_ email: String, completion: @escaping((Bool)->Void)) {
        database.child(email).observeSingleEvent(of: .value, with: { DataSnapshot in
            guard DataSnapshot.value as? String != nil else {
                completion(false)
                return
            }
            completion(true)
        })
    }
}
