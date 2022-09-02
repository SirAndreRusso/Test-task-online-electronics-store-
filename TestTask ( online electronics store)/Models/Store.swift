//
//  Store.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 30.08.2022.
//
import Foundation

struct Store: Codable, Hashable {
    let hotSales: [HotSales]
    let bestSeller: [BestSeller]
    
    enum CodingKeys: String, CodingKey {
        case hotSales = "home_store"
        case bestSeller = "best_seller"
    }
}

