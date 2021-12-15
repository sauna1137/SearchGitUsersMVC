
## SearchGitHubUser
GitHubのユーザーを検索するアプリケーションをMVCで作成


## 機能一覧
・検索バーでユーザー名を検索
・ユーザーを選択するとGitHubのユーザーのページへ遷移

## 開発で使用した技術
・MVCモデル開発
・JSON解析　Codable
・UIkit
・AutoLayout
・nabigationController
・tableViewController
・SwiftLint

 
以下、使用したCocoaPods ライブラリ
```
pod 'Alamofire' 
pod 'SDWebImage'
pod 'LicensePlist'
```

```
# ユーザー検索画面 - SearchViewController.swift　
import UIKit
import SDWebImage

# GitHub ユーザー画面 - ProfileViewController.swift
import UIKit
import WebKit

# 検索結果を取得するモデル - FetchGitHubUsers.swift
import Foundation
import Alamofire

###　iPhone設定画面、当アプリの項目にてライセンス、ヴァージョン表示
・LicensePlist
```

## アプリ作成においてのポイント
#### ① あえて統一感なくStoryboardとコードで画面を構成しました
ユーザー検索画面はStoryboard上で、GitHubユーザー画面ではコードで作成しました。

#### ② 様々な値渡しの実装
デリゲートメソッド、クロージャ、メソッドでのファイル間の値渡しを実装しました。

#### ③ エクステンションの利用
Storyboard,ViewController,TableViewCellのインスタンス化を簡潔にできるようにしました。

#### ④ カプセル化
classやプロパティを可能な限りファイル内のみで使用できる様にしました。

#### ⑤ LaunchScreen
何をするアプリか分かりやすくシンプルにデザインしました。
