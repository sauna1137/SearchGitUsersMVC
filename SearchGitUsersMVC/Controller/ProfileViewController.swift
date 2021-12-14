//
//  ProfileViewController.swift
//  SearchGitUsersMVC
//
//  Created by KS on 2021/12/13.
//

import UIKit
import WebKit

class ProfileViewController: UIViewController {

    private var webView = WKWebView()
    private var urlString = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // webViewのサイズを指定
        webView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        view.addSubview(webView)

        let urlForRequest = URL(string: urlString)
        let request = URLRequest(url: urlForRequest!)
        webView.load(request)
    }

    // ユーザー選択時にURLを受け取るためのメソッド
    func passUserURLString(URLString: String) {
        self.urlString = URLString
    }
}
