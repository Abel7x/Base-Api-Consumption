//
//  Post.swift
//  Base API Consumption
//
//  Created by Ricardo Abel Martinez Vivanco on 1/7/19.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation

struct Post: Codable {
    
    let id: Double
    let userId: Double
    let title: String
    let body: String
    
    init(id: Double, userId: Double, title: String, body: String){
        self.id = id
        self.userId = userId
        self.title = title
        self.body = body
    }
}
