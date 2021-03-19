//
//  TopicCommentsViewDelegate.swift
//  DiscourseClient
//
//  Created by Rodrigo  Candido on 15/3/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import Foundation


protocol TopicCommentsViewDelegate {
    func didChangeComments()
    func didChangeUsers()
    func didChangeDate()
}
