//
//  BestSeller.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 25.08.2022.
//

import Foundation

struct BestSeller: Codable,Hashable {
    let id: Int
    let isFavorites: Bool
    let title: String
    let priceWithoutDiscount: Int
    let discountPrice: Int
    let picture: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case isFavorites = "is_favorites"
        case title = "title"
        case priceWithoutDiscount = "price_without_discount"
        case discountPrice = "discount_price"
        case picture = "picture"
    }
}
