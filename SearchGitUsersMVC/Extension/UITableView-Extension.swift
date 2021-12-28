//
//  UITableView-Extension.swift
//  SearchGitUsersMVC
//
//  Created by KS on 2021/12/13.
//

import UIKit

extension UITableView {
    func registerCustomCell<T: UITableViewCell>(_ cellType: T.Type) {
        register(UINib(nibName: T.identifier, bundle: nil), forCellReuseIdentifier: T.identifier)
    }

    func dequeueReusableCustomCell<T: UITableViewCell>(with cellType: T.Type) -> T {
        return dequeueReusableCell(withIdentifier: T.identifier) as! T
    }
}
