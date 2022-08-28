//
//  Models.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 25.08.2022.
//

import Foundation

// MARK: - Welcome
struct Category: Codable, Hashable {
    var category: String
    var imageForNormal: String
    var imageForPressed: String
    enum CodingKeys: String, CodingKey {
        case category = "category"
        case imageForNormal = "imageForNormal"
        case imageForPressed = "imageForPressed"
    }
}
struct Store: Codable, Hashable {
    let hotSales: [HotSales]
    let bestSeller: [BestSeller]
    
    enum CodingKeys: String, CodingKey {
        case hotSales = "home_store"
        case bestSeller = "best_seller"
    }
}

// MARK: - BestSeller
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

// MARK: - HotSales
struct HotSales: Codable, Hashable {
    let id: Int
    let isNew: Bool?
    let title: String
    let subtitle: String
    let picture: String
    let isBuy: Bool
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case isNew = "is_new"
        case title = "title"
        case subtitle = "subtitle"
        case picture = "picture"
        case isBuy = "is_buy"
    }
}
