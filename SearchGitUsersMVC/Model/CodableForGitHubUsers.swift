//
//  GitHubUsers.swift
//  SearchGitUsersMVC
//
//  Created by KS on 2021/12/13.
//

import Foundation

struct CodableForGitHubUsers: Decodable {

    let totalCount: Int
    let incompleteResults: Bool
    let items: [GitHubUsers]

     enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items = "items"
    }
}

    struct GitHubUsers: Decodable {
        let login: String
        let userID: Int
        let nodeID: String
        let avatarURL: String
        let gravatarID: String
        let url: String
        let htmlURL: String
        let followersURL: String
        let followingURL: String
        let gistsURL: String
        let starredURL: String
        let subscriptionsURL: String
        let organizationsURL: String
        let reposURL: String
        let eventsURL: String
        let receivedEventsURL: String
        let type: String
        let siteAdmin: Bool
        let score: Int

         enum CodingKeys: String, CodingKey {
            case login = "login"
            case userID = "id"
            case nodeID = "node_id"
            case avatarURL = "avatar_url"
            case gravatarID = "gravatar_id"
            case url = "url"
            case htmlURL = "html_url"
            case followersURL = "followers_url"
            case followingURL = "following_url"
            case gistsURL = "gists_url"
            case starredURL = "starred_url"
            case subscriptionsURL = "subscriptions_url"
            case organizationsURL = "organizations_url"
            case reposURL = "repos_url"
            case eventsURL = "events_url"
            case receivedEventsURL = "received_events_url"
            case type = "type"
            case siteAdmin = "site_admin"
            case score = "score"
        }
    }
