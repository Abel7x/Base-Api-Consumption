//
//  PostsViewController.swift
//  Base API Consumption
//
//  Created by Ricardo Abel Martinez Vivanco on 1/7/19.
//  Copyright © 2019 personal. All rights reserved.
//

import UIKit

class PostsViewController: UIViewController {
    
    let controller = PostListController()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureController()
    }
    
    private func configureController() {
        controller.updatedPosts = { [unowned self] in
            DispatchQueue.main.async { [unowned self] in
                self.tableView.reloadData()
            }
        }
        controller.retrievePosts()
    }
    
    private func configureTableView() {
        tableView.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: PostTableViewCell.reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension PostsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.totalPosts
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.reuseIdentifier) ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? PostTableViewCell else { return }
        cell.configureWith(post: controller.getPostAt(index: indexPath))
    }
}
