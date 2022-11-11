//
//  ImageLoader.swift
//  CakeItApp
//
//  Created by Stephen Chase on 11/11/22.
//

import Foundation
import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

class ImageLoader: UIImageView {
    var imageURL: URL?
    let activityIndicator = UIActivityIndicatorView()
    
    func loadImageWithUrl(_ url: URL) async {
        // setup activityIndicator...
        activityIndicator.color = .darkGray
        addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageURL = url
        image = nil
        activityIndicator.startAnimating()
        self.contentMode = .scaleAspectFill
        /// Retrieves image if already available in cache
        if let imageFromCache = imageCache.object(forKey: url as AnyObject) as? UIImage {
            self.image = imageFromCache
            activityIndicator.stopAnimating()
            return
        }
        
        /// Image does not available in cache.. so retrieving it from url...
        do {
            self.image = UIImage(named: "iconNotFound")
            let (data, _) = try await URLSession.shared.data(from: url)
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                if let imageToCache = UIImage(data: data) {
                    if self.imageURL == url {
                        self.image = imageToCache
                    }
                    imageCache.setObject(imageToCache, forKey: url as AnyObject)
                }
            }
        } catch {
            self.activityIndicator.stopAnimating()
        }
    }
}
