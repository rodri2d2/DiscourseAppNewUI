//
//  UsersDataManager.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 28/03/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation

protocol UsersDataManager: class {
    func fetchAllUsers(completion: @escaping (Result<UsersResponse?, Error>) -> ())
}
