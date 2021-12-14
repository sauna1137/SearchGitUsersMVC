//
//  UIStoryboard-Extension.swift
//  SearchGitUsersMVC
//
//  Created by KS on 2021/12/14.
//

import UIKit

extension UIStoryboard {

    static var searchVC: SearchViewController {
        return UIStoryboard(name: "SearchView", bundle: nil).instantiateViewController(withIdentifier: "SearchVC") as! SearchViewController
    }

    static var profileVC: ProfileViewController {
        return UIStoryboard(name: "ProfileView", bundle: nil).instantiateViewController(withIdentifier: "ProfileVC") as! ProfileViewController
    }
}
