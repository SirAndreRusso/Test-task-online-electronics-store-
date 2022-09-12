//
//  Product.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 11.09.2022.
//

import Foundation

struct Product:  Hashable, Codable {
    var productDetails: ProductDetails
    var delivery: String
    var count: Int
    var totalCost: Int {
        productDetails.price * count
    }
    var totalDiscountCost: Int? {
        guard let discountPrice = productDetails.discountPrice else {return nil}
           return discountPrice * count
    }
}
