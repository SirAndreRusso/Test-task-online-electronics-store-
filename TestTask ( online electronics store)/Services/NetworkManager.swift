//
//  NetworkManager.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 26.08.2022.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func fetchCategories(completion: @escaping(Result<[Category], Error>)-> Void) {
        guard let path = Bundle.main.path(forResource: "Categories", ofType: "json") else {
        completion(.failure(Errors.invalidPath))
            print("Error here")
            return
        }
        let jsonData = try? String(contentsOfFile: path).data(using: .utf8)
        if let data = jsonData {
            let decodedData = try? JSONDecoder().decode([Category].self, from: data)
            guard let fetchedCategories = decodedData else {
                return
            }
           
            DispatchQueue.main.async {
                completion(.success(fetchedCategories))
            } 
        }
    }
    func fetchHotSales(completion: @escaping(Result<[HotSales], Error>)-> Void) {
        guard let url = URL(string: "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175") else {
            print("Error in url")
            return}
        let urlRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        URLSession.shared.dataTask(with: urlRequest)  {  data, responce, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                let store = try? JSONDecoder().decode(Store
                    .self, from: data)
                guard let fetchedStore = store else {return}
                DispatchQueue.main.async {
                    completion(.success(fetchedStore.hotSales))
                }
            } else {print("WTF")}
            
        } .resume()
    }
    
    
    func fetchBestSeller(completion: @escaping(Result<[BestSeller], Error>)-> Void) {
        guard let url = URL(string: "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175") else {
            print("Error in url")
            return}
        let urlRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        URLSession.shared.dataTask(with: urlRequest)  {  data, responce, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                let store = try? JSONDecoder().decode(Store
                    .self, from: data)
                guard let fetchedStore = store else {return}
                DispatchQueue.main.async {
                    completion(.success(fetchedStore.bestSeller))
                }
            } else {print("WTF")}
            
        } .resume()
    }
}