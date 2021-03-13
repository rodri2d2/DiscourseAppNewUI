//
//  UserDataManager.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 28/03/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation

protocol UserDataManager: class {
    func fetchUser(username: String, completion: @escaping (Result<UserResponse?, Error>) -> ())
    func updateUserName(username: String, name: String, completion: @escaping (Result<UpdateUserNameResponse?, Error>) -> ())
}
