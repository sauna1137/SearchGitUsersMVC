//
//  UserInfoTableViewCell.swift
//  SearchGitUsersMVC
//
//  Created by KS on 2021/12/13.
//

import UIKit

class UserInfoTableViewCell: UITableViewCell {
    @IBOutlet weak private var profileImageView: UIImageView!
    @IBOutlet weak private var userNameLabel: UILabel!
    @IBOutlet weak private var userTypeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
