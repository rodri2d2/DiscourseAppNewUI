//
//  Icons.swift
//  DiscourseClient
//
//  Created by Rodrigo  Candido on 19/3/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import Foundation

enum Icons: String {
    
    case answers    = "icoSmallAnswers"
    case views      = "icoViewsSmall"
    case calendar   = "icoSmallCalendar"
    case inicio     = "inicio"
    case inicioSelc = "inicioSelected"
    case users      = "users"
    case userSelc   = "usersSelected"
    
    static func icon(icon: Icons) -> String {
        return icon.rawValue
    }
}

enum Images: String {
    case fab = "icoFAB"
    case avatar = "avatar"
    
    static func image(image: Images) -> String {
        return image.rawValue
    }
}
