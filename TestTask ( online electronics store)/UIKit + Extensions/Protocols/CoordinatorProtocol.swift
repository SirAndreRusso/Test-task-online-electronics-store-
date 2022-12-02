//
//  CoordinatorProtocol.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 27.11.2022.
//

import Foundation
import UIKit

protocol CoordinatorProtocol {
    var tabBarController: UITabBarController {get set}
    func start()
    func eventOccured(with type: Event)
}

protocol CoordinatingProtocol {
    var coordinator: Coordinator? {get set}
}
