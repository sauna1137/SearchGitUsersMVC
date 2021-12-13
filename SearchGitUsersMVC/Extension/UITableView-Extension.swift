//
//  UITableView-Extension.swift
//  SearchGitUsersMVC
//
//  Created by KS on 2021/12/13.
//

import UIKit

extension UITableView {

    // Cellを登録する際に使用 CellのIdentifierは"Cell"にすること
    func registerCustomCell<T: UITableViewCell>(_ cellType: T.Type) {
        register(UINib(nibName: T.identifier, bundle: nil), forCellReuseIdentifier: "Cell")
    }

    // dequeuReusableCustomCellとして登録する際のメソッド CellのIdentifierは"Cell"にすること
    func dequeueReusableCustomCell<T: UITableViewCell>(with cellType: T.Type) -> T {
        return dequeueReusableCell(withIdentifier: "Cell") as! T
    }
}
