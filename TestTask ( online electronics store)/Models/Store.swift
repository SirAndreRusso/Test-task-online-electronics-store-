//
//  Store.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 30.08.2022.
//
import Foundation

struct Store<H: HotSalesProtocol, B: BestSellerProtocol>: StoreProtocol {
    typealias hotSales = H
    typealias bestSeller = B
    var hotSales: [hotSales]
    var bestSeller: [bestSeller]
   
    enum CodingKeys: String, CodingKey {
        case hotSales = "home_store"
        case bestSeller = "best_seller"
    }
}

