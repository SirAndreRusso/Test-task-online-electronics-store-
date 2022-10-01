//
//  BasketProtocol.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 19.09.2022.
//

import Foundation

protocol BasketProtocol: Hashable, Codable {
    associatedtype product: ProductProtocol
    var basket: [product] {get}
    var delivery: String {get}
    var id: String {get}
    var total: Int {get}
}

