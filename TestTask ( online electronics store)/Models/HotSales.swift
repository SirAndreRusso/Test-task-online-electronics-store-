//
//  HotSales.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 30.08.2022.
//

import Foundation
struct HotSales: HotSalesProtocol {
    var id: Int
    var isNew: Bool?
    var title: String
    var subtitle: String
    var picture: String
    var isBuy: Bool
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case isNew = "is_new"
        case title = "title"
        case subtitle = "subtitle"
        case picture = "picture"
        case isBuy = "is_buy"
    }
}
