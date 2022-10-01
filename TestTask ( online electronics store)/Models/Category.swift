//
//  Category.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 30.08.2022.
//

import Foundation

struct Category: CategoryProtocol {
    var category: String
    var imageForNormal: String
    var imageForPressed: String
    enum CodingKeys: String, CodingKey {
        case category = "category"
        case imageForNormal = "imageForNormal"
        case imageForPressed = "imageForPressed"
    }
}
