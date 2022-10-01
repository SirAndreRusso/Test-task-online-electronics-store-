//
//  ProductDetailsProtocol.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 12.09.2022.
//

import Foundation

protocol ProductDetailsVCProtocol {
    var productDetails: (any ProductDetailsProtocol)? {get set}
    var discountPrice: Int? {get set}
    func fetchData()
}
