//
//  UIViewController+Extensions.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 08/02/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import UIKit

extension UIViewController {
    /// Muestra un alertcontroller con una única acción
    /// - Parameters:
    ///   - alertMessage: Mensaje del alert
    ///   - alertTitle: Título del alert
    ///   - alertActionTitle: Título de la acción
    func showAlert(_ alertMessage: String,
                               _ alertTitle: String = NSLocalizedString("Error", comment: ""),
                               _ alertActionTitle: String = NSLocalizedString("OK", comment: "")) {

        let alertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: alertActionTitle, style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
