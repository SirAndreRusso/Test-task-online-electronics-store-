//
//  CategoryProtocol.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 19.09.2022.
//

import Foundation

protocol CategoryProtocol: Codable, Hashable {
    var category: String {get}
    var imageForNormal: String {get}
    var imageForPressed: String {get}
}
