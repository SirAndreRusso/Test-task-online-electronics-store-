//
//  Basket.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 13.09.2022.
//

import Foundation

struct Basket: Hashable, Codable {
    let basket: [Product]
    let delivery, id: String
    let total: Int
}
