//
//  ProductDetailsProtocol.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 19.09.2022.
//

import Foundation

protocol ProductDetailsProtocol: Codable, Hashable {
    var cpu: String {get}
    var camera: String {get}
    var capacity: [String] {get}
    var color: [String] {get}
    var id: String {get}
    var images: [String] {get}
    var isFavorites: Bool {get}
    var price: Int {get}
    var rating: Double {get}
    var sd: String {get}
    var ssd: String {get}
    var title: String {get}
    var discountPrice: Int? {get set}
}
