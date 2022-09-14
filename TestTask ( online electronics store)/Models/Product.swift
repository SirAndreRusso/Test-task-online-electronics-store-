//
//  Product.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 11.09.2022.
//

import Foundation

struct Product:  Hashable, Codable {
    let id: Int
        let images: String
        let price: Int
        let title: String
}
