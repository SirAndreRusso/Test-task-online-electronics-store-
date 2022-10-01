//
//  ProductProtocol.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 19.09.2022.
//

import Foundation

protocol ProductProtocol: Codable, Hashable {
    var id: Int {get}
    var images: String {get}
    var price: Int {get}
    var title: String {get}
}
