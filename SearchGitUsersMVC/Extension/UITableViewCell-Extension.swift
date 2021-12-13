//
//  UITableViewCell-Extension.swift
//  SearchGitUsersMVC
//
//  Created by KS on 2021/12/13.
//

import UIKit

extension UITableViewCell {
    // identifierでString型のclassNameを出力 NSObjectProtocol-ExtensionでclassNameの出力機能を追加
    static var identifier: String {
        return className
    }
}
