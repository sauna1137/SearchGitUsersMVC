//
//  SearchViewController.swift
//  SearchGitUsersMVC
//
//  Created by KS on 2021/12/13.
//

import UIKit
import SDWebImage

final class SearchViewController: UIViewController {

    @IBOutlet weak private var searchBar: UISearchBar!
    @IBOutlet weak private var tableView: UITableView!

    private var fetchGitHubUsers = FetchGitHubUsers()
    private var gitHubUsers = [GitHubUsers]()

    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        fetchGitHubUsers.fetchGitHubUsersDelegate = self

        // Cell登録
        tableView.registerCustomCell(UserInfoTableViewCell.self)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

// MARK: - Extension

// MARK: - UISearchBarDelegae
extension SearchViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // 検索時にキーワードがなければエラー
        guard !searchBar.text!.isEmpty else {
            present(UIAlertController().alert(title: "検索するユーザー名を入力してください", message: "", actATitle: "OK"),
                    animated: true, completion: nil)
            return
        }
        // 検索バーのキーワードをもとにAPIを叩き受け取ったデータを元にtableViewを更新
        fetchGitHubUsers.fetchGitHubUsers(searchText: searchBar.text!) { users in
            self.gitHubUsers = users
            self.tableView.reloadData()
            self.view.endEditing(true)
        }
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        gitHubUsers.removeAll()
        tableView.reloadData()
    }
}

// MARK: - UITableView
extension SearchViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let profileVC = UIStoryboard.profileVC
        profileVC.passUserURLString(gitHubUser: gitHubUsers[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(profileVC, animated: true)
    }
}

extension SearchViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gitHubUsers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCustomCell(with: UserInfoTableViewCell.self)
        cell.setUpCell(gitHubUsers: gitHubUsers, indexPath: indexPath.row)
        return cell
    }
}

// MARK: - Delegate
extension SearchViewController: FetchGitHubUsersDelegate {
    func presentAlert(content: String) {
        present(UIAlertController().alert(title: content, message: "", actATitle: "OK"), animated: true, completion: nil)
    }
}
