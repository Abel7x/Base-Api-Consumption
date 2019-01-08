//
//  PostService.swift
//  Base API Consumption
//
//  Created by Ricardo Abel Martinez Vivanco on 1/7/19.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation

class PostService: BaseService<Post> {
    
    private let resourceURL = "posts"
    
    func getPostList(completion: @escaping (ServiceResponse<Post>) -> Void) {
        guard let endpoint = URL(string: baseURL + resourceURL) else {
            completion(.failure(error: ServiceError.badRequest))
            return
        }
        
        var request = URLRequest(url: endpoint)
        request.httpMethod = "GET"
        execute(request: request, completion: completion)
    }
}
