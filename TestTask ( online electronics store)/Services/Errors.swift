//
//  Errors.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 26.08.2022.
//
import Foundation
enum Errors {
    case invalidPath
  
}
extension Errors: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidPath:
            return NSLocalizedString("invalidPath", comment: "invalidPath to Categories.json")
        }
    }
}
