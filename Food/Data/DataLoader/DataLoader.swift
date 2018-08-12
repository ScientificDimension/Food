//
//  DataLoader.swift
//  Food
//
//  Created by Oleg Kolomyitsev on 11/08/2018.
//  Copyright © 2018 Oleg Kolomyitsev. All rights reserved.
//

import Foundation
import PromiseKit

enum NetworkError: Error {
    case requestTimeoutError
    case requestError
    case authorizationError
    case unknownError
    case emptyResponseError
    case serializationError
    case serverError(message: String, code: Int)
    case networkError
}

class DataLoader: IDataLoader {
    
    let session = URLSession(configuration: .default)
    
    // MARK: - Memory Management

    let baseUrl: String
    
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    // MARK: - IDataLoader
    
    func getModels() -> Promise<[FoodModel]> {
        return Promise { seal in
            getData()
                .done { container in
                    let models = container.payload.foundPlaces.map { FoodModel(place: $0.place) }
                    seal.fulfill(models)
                }
                .catch { error in
                    seal.reject(error)
            }
        }
    }
    
    // MARK: - Data Retrieving
    
    private func getData() -> Promise<Container> {
        let queryString = "latitude=55.762885&longitude=37.597360"
        let urlString = baseUrl + Constants.route + Constants.endPoint + "?" + queryString
        return Promise { seal in
            guard let url = URL(string: urlString) else {
                seal.reject(NetworkError.requestError)
                return
            }
            session.dataTask(with: url) { (data, response, error) in
                guard
                    let data = data,
                    let container = try? JSONDecoder().decode(Container.self, from: data) else {
                        seal.reject(NetworkError.serializationError)
                        return
                }
                seal.fulfill(container)
                }.resume()
        }
    }
}
