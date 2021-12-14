//
//  UserInfoTableViewCell.swift
//  SearchGitUsersMVC
//
//  Created by KS on 2021/12/13.
//

import UIKit

final class UserInfoTableViewCell: UITableViewCell {

    @IBOutlet weak private var profileImageView: UIImageView!
    @IBOutlet weak private var userNameLabel: UILabel!
    @IBOutlet weak private var userTypeLabel: UILabel!

    // cellForRowAtで使用する　取得したGitHubUsersのデータをUIに反映させる
    func setUpCell(gitHubUsers: [GitHubUsers], indexPath: Int) {
        profileImageView.sd_setImage(with: URL(string: gitHubUsers[indexPath].imageURL), completed: nil)
        userNameLabel.text = gitHubUsers[indexPath].userName
        userTypeLabel.text = gitHubUsers[indexPath].type
    }
}
