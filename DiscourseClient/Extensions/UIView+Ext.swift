//
//  UIView+Ext.swift
//  DiscourseClient
//
//  Created by Rodrigo  Candido on 15/3/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import UIKit


/*
 This extension implements custom functionalities to UIView Class
 */
extension UIView {
    
    /**
     PIN a view to its super - Use this function to pin a view when this ocupies the entire Screen space of its super
     - Parameter superView: Its main or super container view to be pinned in
     
     ## Example
     
     Being at some ViewController or a Class that has a implementation of UIView, send this view property as parameter
     ~~~
     class ViewController: UIViewController {
         override func viewDidLoad() {
             super.viewDidLoad()
             tableView.pin(to: self.view)
         }
     }
     ~~~
     
     - Author: Rodrigo Candido
     - Version: v1.0
     
     */
    func pin(to superView: UIView){
        
        if let _ = superview {
            translatesAutoresizingMaskIntoConstraints                                  = false
            topAnchor.constraint      (equalTo:      superview!.topAnchor  ).isActive  = true
            leadingAnchor.constraint  (equalTo:  superview!.leadingAnchor  ).isActive  = true
            trailingAnchor.constraint (equalTo: superview!.trailingAnchor  ).isActive  = true
            bottomAnchor.constraint   (equalTo:   superview!.bottomAnchor  ).isActive  = true
        }
    }
    
    func pinWintSafety(to superView: UIView){
        
        if let _ = superview {
            translatesAutoresizingMaskIntoConstraints                                                       = false
            topAnchor.constraint      (equalTo:  superview!.safeAreaLayoutGuide.topAnchor       ).isActive  = true
            leadingAnchor.constraint  (equalTo:  superview!.safeAreaLayoutGuide.leadingAnchor   ).isActive  = true
            trailingAnchor.constraint (equalTo:  superview!.safeAreaLayoutGuide.trailingAnchor  ).isActive  = true
            bottomAnchor.constraint   (equalTo:  superview!.safeAreaLayoutGuide.bottomAnchor    ).isActive  = true
        }
    }
}
