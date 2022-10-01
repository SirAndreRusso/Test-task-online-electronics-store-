//
//  Basket.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 13.09.2022.
//

import Foundation

struct Basket<P: ProductProtocol>: BasketProtocol {
    typealias product = P
    var basket: [P]
    let delivery: String
    var id: String
    let total: Int
}

