//
//  UIViewController + Extensions.swift
//  Millionaire
//
//  Created by Pavel Olegovich on 29.01.2022.
//

import Foundation
import UIKit

extension UIViewController {
        func createAlertOk(title: String, message: String?, completion: @escaping () -> Void) {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okButton = UIAlertAction(title: "Ok", style: .default) { _ in
                completion()
            }
            alertController.addAction(okButton)
            present(alertController, animated: true, completion: nil)
        }
}
