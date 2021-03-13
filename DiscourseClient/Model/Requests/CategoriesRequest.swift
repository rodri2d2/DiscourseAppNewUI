//
//  CategoriesRequest.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 28/03/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation

class CategoriesRequest: APIRequest {
    typealias Response = CategoriesResponse

    var method: Method {
        return .GET
    }

    var path: String {
        return "/categories.json"
    }

    var parameters: [String : String] {
        return [:]
    }

    var body: [String : Any] {
        return [:]
    }

    var headers: [String : String] {
        return [:]
    }
}
