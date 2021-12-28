//
//  FetchGitHubUsers.swift
//  SearchGitUsersMVC
//
//  Created by KS on 2021/12/13.
//

import Foundation
import Alamofire

protocol FetchGitHubUsersDelegate: AnyObject {
    func presentAlert(content: String)
}

class FetchGitHubUsers {

    weak var fetchGitHubUsersDelegate: FetchGitHubUsersDelegate?
    private let gitHubAPIURL = "https://api.github.com/search/users?q=" // ユーザー情報を取得するAPI q=以下にキーワード

    // SearchVCで検索キーワードを元にAPIを叩いて値を返す
    func fetchGitHubUsers(searchText: String, completion: @escaping ([GitHubUsers]) -> Void) {

        AF.request(gitHubAPIURL + searchText) { _ in } .response { response in

            guard let data = response.data else {
                self.fetchGitHubUsersDelegate?.presentAlert(content: "ユーザーは見つかりませんでした。")
                return
            }

            do {
                let json = try JSONDecoder().decode(CodableForGitHubUsers.self, from: data)
                let totalCount = json.totalCount

                guard totalCount > 0 else {
                    self.fetchGitHubUsersDelegate?.presentAlert(content: "ユーザーは見つかりませんでした。")
                    return
                }

                completion(json.items)

            } catch {
                print(error.localizedDescription)
                self.fetchGitHubUsersDelegate?.presentAlert(content: "予期せぬエラーが発生しました")
            }
        }
    }
}
