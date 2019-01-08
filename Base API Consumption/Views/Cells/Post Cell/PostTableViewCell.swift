//
//  PostTableViewCell.swift
//  Base API Consumption
//
//  Created by Ricardo Abel Martinez Vivanco on 1/7/19.
//  Copyright © 2019 personal. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "postCell"

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureWith(post: Post){
        titleLabel.text = post.title
    }
    
    
}
