//
//  NSObjectProtocol-Extension.swift
//  SearchGitUsersMVC
//
//  Created by KS on 2021/12/13.
//

import Foundation
// classNameで自身のclassの名前をStringで取得
extension NSObjectProtocol {
    static var className: String {
        return String(describing: self)
    }
}
