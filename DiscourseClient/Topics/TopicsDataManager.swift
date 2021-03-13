//
//  TopicsDataManager.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 01/02/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation

/// Errores que pueden darse en el topics data manager
enum TopicsDataManagerError: Error {
    case unknown
}

/// Data Manager con las opraciones necesarias de este módulo
protocol TopicsDataManager {
    func fetchAllTopics(completion: @escaping (Result<LatestTopicsResponse?, Error>) -> ())
}
