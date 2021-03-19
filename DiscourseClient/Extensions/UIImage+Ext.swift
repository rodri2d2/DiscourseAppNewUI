//
//  UIImage+Ext.swift
//  DiscourseClient
//
//  Created by Rodrigo  Candido on 19/3/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import UIKit

extension UIImage{
    
    static func icon(icon: Icons) -> UIImage{
        return UIImage(named: Icons.icon(icon: icon)) ?? UIImage(systemName: "number")!
    }
    
    static func image(image: Images)->UIImage{
        return UIImage(named: Images.image(image: image)) ?? UIImage(systemName: "number")!
    }
    
}
