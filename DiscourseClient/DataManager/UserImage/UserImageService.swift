//
//  UserImageProtocol.swift
//  DiscourseClient
//
//  Created by Rodrigo  Candido on 17/3/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import Foundation

protocol UserImageService {
    func fetchUserImage(userURLTemplate: String, size: String, completion: @escaping (_ imageData: Data)-> ())
}
