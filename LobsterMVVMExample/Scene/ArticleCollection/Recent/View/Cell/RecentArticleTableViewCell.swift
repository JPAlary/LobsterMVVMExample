//
//  RecentArticleTableViewCell.swift
//  LobsterMVVMExample
//
//  Created by Jean Pierre Alary on 12/12/2019.
//  Copyright © 2019 Jean-Pierre Alary. All rights reserved.
//

import UIKit

final class RecentArticleTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var tagListLabel: UILabel!
    @IBOutlet private weak var authorNameLabel: UILabel!
    
    // MARK: - View life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.text = nil
        tagListLabel.text = nil
        authorNameLabel.text = nil
    }
    
    // MARK: - Public
    
    func configure(with viewModel: RecentArticleViewModel) {
        titleLabel.text = viewModel.title
        tagListLabel.text = viewModel.tags
        authorNameLabel.text = viewModel.authorName
    }
}
