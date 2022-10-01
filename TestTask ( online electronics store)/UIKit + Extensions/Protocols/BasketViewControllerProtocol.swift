//
//  BasketViewControllerProtocol.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 10.09.2022.
//

import Foundation

protocol BasketVCProtocol {
    var basket: (any BasketProtocol)? {get set}
}
