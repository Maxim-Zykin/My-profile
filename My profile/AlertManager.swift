//
//  AlertManager.swift
//  My profile
//
//  Created by Максим Зыкин on 01.08.2023.
//

import UIKit

class AlertManager {
    
    private static func showBasicAlert(on vc: UIViewController, with title: String, and message: String?) {
       
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Oтмена", style: .cancel))
            alert.addAction(UIAlertAction(title: "Добавить", style: .default))
            vc.present(alert, animated: true)
        }
    }
}

extension AlertManager {
    public static func alertСheckout(on vc: UIViewController) {
        self.showBasicAlert(on: vc, with: "Добавление навыка", and: "Введите название навыка которым вы владеете")
    }
}
