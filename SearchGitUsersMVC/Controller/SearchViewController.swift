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

    var fetchGitHubUsers = FetchGitHubUsers()
    var gitHubUsers = [GitHubUsers]()

    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self

        // Cell登録
        tableView.registerCustomCell(UserInfoTableViewCell.self)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

// MARK: - Extension
extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {

        if let searchText = searchBar.text {
            fetchGitHubUsers.fetchGitHubUsers(searchText: searchText) { users in

                print(users.count)
                print(users)

                self.gitHubUsers = users
                self.tableView.reloadData()
            }
            view.endEditing(true)
        } else {
            // TODO: アラート　文字を入力
        }
    }
}

extension SearchViewController: UITableViewDelegate {
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
