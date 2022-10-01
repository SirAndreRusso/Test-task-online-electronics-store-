//
//  BestSellerProtocol.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 19.09.2022.
//

import Foundation

protocol BestSellerProtocol: Codable, Hashable {
    var id: Int {get}
    var isFavorites: Bool {get}
    var title: String {get}
    var priceWithoutDiscount: Int {get}
    var discountPrice: Int {get}
    var picture: String {get}
}
