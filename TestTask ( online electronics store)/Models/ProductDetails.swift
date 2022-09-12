//
//  ProductDetails.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 30.08.2022.
//

import Foundation

struct ProductDetails: Codable, Hashable {
    
    let cpu: String
    let camera: String
    let capacity: [String]
    let color: [String]
    let id: String
    let images: [String]
    let isFavorites: Bool
    let price: Int
    let rating: Double
    let sd: String
    let ssd: String
    let title: String
    var discountPrice: Int?
    
    enum CodingKeys: String, CodingKey {
        case cpu = "CPU"
        case camera = "camera"
        case capacity = "capacity"
        case color = "color"
        case id = "id"
        case images = "images"
        case isFavorites = "isFavorites"
        case price = "price"
        case rating = "rating"
        case sd = "sd"
        case ssd = "ssd"
        case title = "title"
        case discountPrice = "discountPrice"
    }
   
    
}
struct ProductImage: Codable, Hashable {
    let image: String
}
struct ProductColor: Codable, Hashable {
    let color: String
}
struct ProductCapacity: Codable, Hashable {
    let capacity: [String]
}

