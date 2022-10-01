//
//  NetworkManager.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 26.08.2022.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func fetchCategories(completion: @escaping(Result<[any CategoryProtocol], Error>)-> Void) {
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
                completion(.success(fetchedCategories as [any CategoryProtocol]))
            }
        }
    }
    
    func fetchHotSales(completion: @escaping(Result<[any HotSalesProtocol], Error>)-> Void) {
        guard let url = URL(string: "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175") else {
            print("Error in url")
            return}
        let urlRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        URLSession.shared.dataTask(with: urlRequest)  {  data, responce, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            } else if let data = data {
                let store = try? JSONDecoder().decode(Store<HotSales, BestSeller>
                    .self, from: data)
                guard let fetchedStore = store else {return}
                DispatchQueue.main.async {
                    completion(.success(fetchedStore.hotSales as [any HotSalesProtocol]))
                }
            }
            
        } .resume()
    }
    
    func fetchBestSeller(completion: @escaping(Result<[any BestSellerProtocol], Error>)-> Void) {
        guard let url = URL(string: "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175") else {
            print("Error in url")
            return}
        let urlRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        URLSession.shared.dataTask(with: urlRequest)  {  data, responce, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            } else if let data = data {
                let store = try? JSONDecoder().decode(Store<HotSales, BestSeller>
                    .self, from: data)
                guard let fetchedStore = store else {return}
                DispatchQueue.main.async {
                    completion(.success(fetchedStore.bestSeller as [any BestSellerProtocol]))
                }
            }
            
        } .resume()
    }
    
    func fetchProductDetails(completion: @escaping(Result<any ProductDetailsProtocol, Error>)-> Void) {
        guard let url = URL(string: "https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5") else {
            print("Error in url")
            return}
        let urlRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        URLSession.shared.dataTask(with: urlRequest)  {  data, responce, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            } else if let data = data {
                let productDetails = try? JSONDecoder().decode(ProductDetails
                    .self, from: data)
                guard let fetchedProductDetails = productDetails else {return}
                DispatchQueue.main.async {
                    completion(.success(fetchedProductDetails as any ProductDetailsProtocol))
                }
            }
            
        } .resume()
    }
    
    func fetchBasket(completion: @escaping(Result<any BasketProtocol, Error>)-> Void) {
        guard let url = URL(string: "https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149") else {
            print("Error in url")
            return}
        let urlRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        URLSession.shared.dataTask(with: urlRequest)  {  data, responce, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            } else if let data = data {
                let basket = try? JSONDecoder().decode(Basket <Product>
                    .self, from: data)
                guard let fetchedBasket = basket else {return}
                DispatchQueue.main.async {
                    completion(.success(fetchedBasket))
                }
            }
            
        } .resume()
    }
}
