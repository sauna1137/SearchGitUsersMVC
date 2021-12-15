//
//  ProfileViewController.swift
//  SearchGitUsersMVC
//
//  Created by KS on 2021/12/13.
//

import UIKit
import WebKit

final class ProfileViewController: UIViewController {

    private var webView = WKWebView()
    private var indicatior = UIActivityIndicatorView()
    private var urlString = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        webView.navigationDelegate = self

        let urlForRequest = URL(string: urlString)
        let request = URLRequest(url: urlForRequest!)
        webView.load(request)
    }

    override func viewDidLayoutSubviews() {
        webView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        indicatior.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        indicatior.style = .medium
        view.addSubview(webView)
        view.addSubview(indicatior)
    }

    // ユーザー選択時にURLを受け取るためのメソッド
    func passUserURLString(gitHubUser: GitHubUsers) {
        urlString = gitHubUser.userURL
        navigationItem.title = gitHubUser.userName
    }
}

// インジケーターを表示するタイミングの指定
extension ProfileViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        indicatior.startAnimating()
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        indicatior.stopAnimating()
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        indicatior.stopAnimating()
        print(error.localizedDescription)
        present(UIAlertController().alert(title: "予期せぬエラーが発生しました。", message: "", actATitle: "OK"), animated: true, completion: nil)
    }
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        indicatior.stopAnimating()
        print(error.localizedDescription)
        present(UIAlertController().alert(title: "予期せぬエラーが発生しました。", message: "", actATitle: "OK"), animated: true, completion: nil)
    }
}
