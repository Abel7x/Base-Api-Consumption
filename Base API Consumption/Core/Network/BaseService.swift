//
//  BaseService
//  Base API Consumption
//
//  Created by Ricardo Abel Martinez Vivanco on 1/7/19.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation

enum ServiceResponse<T> {
    case success(response: T)
    case failure(error: Error)
}

enum ServiceError: Error {
    case badRequest
}

class BaseService<T: Codable> {
    func execute(request: URLRequest, completion: @escaping (ServiceResponse<T>) -> Void) {
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: request) { [unowned self] (data, response, error) in
            if let error = error {
                completion(.failure(error: error))
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200, let json = data else {
                completion(.failure(error: ServiceError.badRequest))
                return
            }
            self.processResponse(json: json, completion: completion)
        }
        dataTask.resume()
    }
    
    private func processResponse(json: Data?,
                                 completion: @escaping (ServiceResponse<T>) -> Void) {
        
        guard let jsonResponse = json else {
            completion(.failure(error: ServiceError.badRequest))
            return
        }
        
        do {
            let responseModel = try parse(json: jsonResponse)
            completion(.success(response: responseModel))
        } catch let error {
            completion(.failure(error: error))
        }
        
    }
    
    open func parse(json: Data) throws -> T {
        return try JSONDecoder().decode(T.self, from: json)
    }
}
