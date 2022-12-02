//
//  NetworkManagerProtocol.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 27.11.2022.
//

import Foundation

protocol NetworkManagerProtocol {
    func fetchCategories(completion: @escaping (Result<[Category], Error>) -> Void)
    func fetchHotSales(completion: @escaping (Result<[HotSales], Error>) -> Void)
    func fetchBestSeller(completion: @escaping (Result<[BestSeller], Error>) -> Void)
    func fetchProductDetails(completion: @escaping (Result<ProductDetails, Error>) -> Void)
    func fetchBasket(completion: @escaping (Result<Basket<Product>, Error>) -> Void)
}
