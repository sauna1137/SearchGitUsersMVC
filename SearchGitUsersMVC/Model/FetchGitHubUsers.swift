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
    private var gitHubUsers = [GitHubUsers]()
    private let maxContents = 30 // APIの構造上30件以上取得できないため

    // SearchVCで検索キーワードを元にAPIを叩いて値を返す
    func fetchGitHubUsers(searchText: String, completion: @escaping ([GitHubUsers]) -> Void) {

        gitHubUsers.removeAll()

        AF.request(gitHubAPIURL + searchText) { _ in } .response { response in

            guard let data = response.data else {
                self.fetchGitHubUsersDelegate?.presentAlert(content: "ユーザーは見つかりませんでした。")
                return
            }

            do {
                let json = try JSONDecoder().decode(CodableForGitHubUsers.self, from: data)
                var totalCount = json.totalCount

                guard totalCount > 0 else {
                    self.fetchGitHubUsersDelegate?.presentAlert(content: "ユーザーは見つかりませんでした。")
                    return
                }

                if totalCount > self.maxContents {
                    totalCount = self.maxContents
                }

                for user in 0..<totalCount {
                    let userName = json.items[user].login
                    let userType = json.items[user].type
                    let imageURL = json.items[user].avatarURL
                    let userURL = json.items[user].htmlURL

                    let newGitHubUser = GitHubUsers(userName: userName, type: userType, imageURL: imageURL, userURL: userURL)
                    self.gitHubUsers.append(newGitHubUser)
                }

                completion(self.gitHubUsers)

            } catch {
                print(error.localizedDescription)
                self.fetchGitHubUsersDelegate?.presentAlert(content: "予期せぬエラーが発生しました")
            }
        }
    }
}
