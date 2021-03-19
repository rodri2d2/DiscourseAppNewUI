//
//  TopicCellViewModel.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 08/02/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation

protocol TopicCellViewModelViewDelegate {
    func didFetchImage()
}


/// ViewModel que representa un topic en la lista
class TopicCellViewModel: CellViewModel{
    
    var type: CellType
    var cellViewModelDelegate: TopicCellViewModelViewDelegate?
    
    let topic: Topic
    var textLabelText: String?
    var posts:         String?
    var postUserCount: String?
    var createdAt:     String?
    var image:         Data?
    
    init(cellType: CellType, topic: Topic, avatarURL: String, dataManager: TopicsDataManager) {
        self.topic     = topic
        textLabelText  = topic.title
        posts          = topic.postsCount.description
        postUserCount  = topic.posters.count.description
        self.type      = cellType
        self.createdAt = formatDate(date: topic.createdAt)
        
        
        dataManager.fetchUserImage(userURLTemplate: avatarURL) { (data) in
            self.image = data
            self.cellViewModelDelegate?.didFetchImage()
        }
    }
    
    
    private func formatDate(date: String) -> String?{
        
        //
        let formatter = DateFormatter()
        
        //Translating to DateFormatter which DateFormat to expect
        let inputFormat = "YYYY-MM-dd'T'HH:mm:ss.SSSZ"
        formatter.locale = Locale(identifier: "es_ES")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = inputFormat
        
        //Create a Date from a specified string
        guard let formattedDate = formatter.date(from: date) else { return nil}
        
        //Translating date to a specified String
        formatter.dateFormat = "MMM dd"
        formatter.locale = Locale(identifier: "es_ES")
        let stringDate = formatter.string(from: formattedDate)
        return stringDate.capitalized(with: formatter.locale)
        
    }
    
    
}
