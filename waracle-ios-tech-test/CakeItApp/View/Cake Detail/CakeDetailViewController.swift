//
//  CakeDetailViewController.swift
//  CakeItApp
//
//  Created by David McCallum on 21/01/2021.
//

import UIKit

class CakeDetailViewController: UIViewController {
    
    @IBOutlet weak var cakeImageView: ImageLoader?
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var descriptionLabel: UILabel?
    
    var viewModel: CakeDetailViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
    }
    
    func setData() {
        titleLabel?.text = viewModel.cakeTitle
        descriptionLabel?.text = viewModel.cakeDesc
        Task {
            guard let url = URL(string: viewModel.cakeImageUrl) else { return }
            await cakeImageView?.loadImageWithUrl(url)
        }
    }
}
