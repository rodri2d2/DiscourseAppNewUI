//
//  UsersResponse.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 28/03/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation

struct UsersResponse: Codable {
    let directoryItems: [DirectoryItem]

    enum CodingKeys: String, CodingKey {
        case directoryItems = "directory_items"
    }
}

struct DirectoryItem: Codable {
    let user: User
}
