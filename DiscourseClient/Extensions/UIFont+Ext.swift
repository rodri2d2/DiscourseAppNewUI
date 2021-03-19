//
//  UIFont+Ext.swift
//  DiscourseClient
//
//  Created by Rodrigo  Candido on 19/3/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import UIKit

extension UIFont {
    
    static var specialCellTitle: UIFont{
        return UIFont.boldSystemFont(ofSize: 22)
    }
    
    
    static var specialCellBody: UIFont {
        return UIFont.systemFont(ofSize: 17)
    }
    
    static var normalCellTitle: UIFont{
        return UIFont.boldSystemFont(ofSize: 17)
    }
    
    static var cellDetailComponent: UIFont{
        return UIFont.systemFont(ofSize: 12)
    }
    
    static var collectionItemName: UIFont{
        return UIFont.systemFont(ofSize: 15)
    }
    
}
