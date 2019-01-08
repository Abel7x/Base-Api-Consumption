//
//  PostListController.swift
//  Base API Consumption
//
//  Created by Ricardo Abel Martinez Vivanco on 1/7/19.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation

class PostListController {
    private var posts = [Post]() {
        didSet {
            updatedPosts()
        }
    }
    var updatedPosts: () -> () = {}
    var totalPosts: Int { return posts.count }
    let service = PostService()
    
    func retrievePosts() {
        service.getPostList(){ [unowned self] result in
            switch result {
            case .success(let posts):
                self.posts = posts
            case .failure:
                /// TODO Handle error
                return
            }
        }
    }
    
    func getPostAt(index: IndexPath) -> Post {
        return posts[index.row]
    }
}
