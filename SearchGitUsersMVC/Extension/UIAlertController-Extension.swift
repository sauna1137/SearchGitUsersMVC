//
//  UIAlertController-Extension.swift
//  SearchGitUsersMVC
//
//  Created by KS on 2021/12/14.
//

import UIKit

extension UIAlertController {
    // タイトルとメッセージを引数にして返すアラート
   static func alert(title: String, message: String, actATitle: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionA = UIAlertAction(title: actATitle, style: .default, handler: nil)
        alert.addAction(actionA)
        return alert
    }
}
