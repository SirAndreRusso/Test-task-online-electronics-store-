//
//  StoreProtocol.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 19.09.2022.
//

import Foundation

protocol StoreProtocol: Codable, Hashable {
    associatedtype hotSales: HotSalesProtocol
    associatedtype bestSeller: BestSellerProtocol
    var hotSales: [hotSales] {get}
    var bestSeller: [bestSeller] {get}
}
