//
//  CartViewControllerProtocol.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 10.09.2022.
//

import Foundation

protocol CartVCProtocol {
    var cart: Cart {get set}
    func reloadData()
}
