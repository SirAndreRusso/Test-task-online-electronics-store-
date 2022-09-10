//
//  Cart.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 03.09.2022.
//

import Foundation

struct Cart: Hashable, Codable {
    
    var products: [Product]
}

struct Product:  Hashable, Codable {
    var productDetails: ProductDetails
    var delivery: String
    var count: Int
}
