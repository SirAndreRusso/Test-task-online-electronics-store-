//
//  UIViewController + Extension.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 25.08.2022.
//

import UIKit

extension UIViewController {
    func showAlert(with title: String, and message: String, completion: @escaping () -> Void = {}) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) {(_) in
            completion()
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
}
