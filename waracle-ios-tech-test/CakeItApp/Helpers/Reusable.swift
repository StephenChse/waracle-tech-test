//
//  Reusable.swift
//  CakeItApp
//
//  Created by Stephen Chase on 11/11/22.
//

import Foundation
import UIKit


public protocol Reusable: AnyObject {}
extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UIViewController: Reusable {}
public extension UIStoryboard {
    
    static var main: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    func initiate<T>() -> T where T: Reusable {
        self.instantiateViewController(withIdentifier: T.reuseIdentifier) as! T
    }
}

extension UITableViewCell: Reusable {}
public extension UITableView {
    func initiate<T>(indexPath: IndexPath) -> T where T: Reusable {
        self.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
}
