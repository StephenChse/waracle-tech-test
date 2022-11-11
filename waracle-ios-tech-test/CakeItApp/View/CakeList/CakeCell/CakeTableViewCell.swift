//
//  CakeTableViewCell.swift
//  CakeItApp
//
//  Created by David McCallum on 21/01/2021.
//

import UIKit

class CakeTableViewCell: UITableViewCell {
    @IBOutlet weak var cakeImageView: ImageLoader?
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var descLabel: UILabel?
    
    func setData(cakeViewModel: CakeViewModel) {
        titleLabel?.text = cakeViewModel.title
        descLabel?.text = cakeViewModel.desc
        Task {
            if let imgURL = URL(string: cakeViewModel.image) {
                await cakeImageView?.loadImageWithUrl(imgURL)
            }
        }
        self.selectionStyle = .none
    }
}
