//
//  HotSalesProtocol.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 19.09.2022.
//

import Foundation

protocol HotSalesProtocol: Codable, Hashable {
    var id: Int {get}
    var isNew: Bool? {get}
    var title: String {get}
    var subtitle: String {get}
    var picture: String {get}
    var isBuy: Bool {get}
}
