//
//  PostListController.swift
//  Base API Consumption
//
//  Created by Ricardo Abel Martinez Vivanco on 1/7/19.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation

class PostListController {
    private var posts = [Post]()
    var postLoadedCallback: () -> () = {}
    var totalPosts: Int { return posts.count }
    
    func retrievePosts() {
        
    }
}
