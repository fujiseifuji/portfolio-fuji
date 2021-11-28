## **アプリケーション名**
  『ストバスぽっと』
## **-ストバスぽっと-とは？**
  バスケットボールゴールがあるスポットを共有するアプリです。

  ふとバスケがしたくなった時、ゴールの場所やコートの状況をお手軽に知ることができる、SNS型のスポット共有アプリを作成しました。

  **URL:https://portfolio-fuji.herokuapp.com/**
## デモ
#### 地名による地図検索・投稿機能
![demo3](https://user-images.githubusercontent.com/73183707/143769830-51cdc438-63d2-4e42-804a-263db2ff0bc9.gif)
#### 地図クリックによる座標取得
![demo2](https://user-images.githubusercontent.com/73183707/143769835-cb635bf0-c2f7-4595-a9b9-db6702405ae5.gif)
#### Ransackを利用した投稿検索機能
![demo4](https://user-images.githubusercontent.com/73183707/143769834-a40bb07a-8b9c-4b6e-832a-9f0c560db1e6.gif)
## **使用技術**
- 開発環境
  - MacOS
  - Docker 20.10.6/ docker-compose 1.29.1
- フロントエンド
  - jQuery 3.6.0
  - HTML / Sass / Bootstrap 5.1.1
- バックエンド
  - Ruby 2.7.5
  - Rails 6.1.4.1
- インフラ
  - CircleCI
  - MySQL 8.0.27
  - AWS (VPC, EC2, ALB, ACM, S3, RDS, Route53, EIP, IAM)
- その他使用ツール
  - Visual Studio Code
  - draw.io

## 機能
- ユーザー登録関連(devise)
  - 新規登録、プロフィール編集機能
  - 削除機能
  - ログイン、ログアウト機能
    - ゲストユーザーログイン機能
  - ユーザーマイページ
    - ユーザー投稿記事

- 投稿機能関連
  - 一覧表示、住所投稿、テキスト投稿、画像アップロード、投稿編集、投稿方法（モーダルウィンドウ）
  - 投稿コメント機能
    - Ajax対応
    - コメント投稿、削除
  - 投稿いいね機能
    - Ajax対応
    - いいね数表示

- 地図機能
  - 地名、住所検索機能
    - マーカー表示、住所情報ウィンドウ表示、住所フォームへ自動入力
  - 地図クリックで住所表示
    - マーカー表示、住所情報ウィンドウ表示

- 検索機能(Ransack)
  - 投稿のキーワード検索

- 画像アップロード機能 (carrierwave, AWS S3)

- テスト機能 (RSpec)
  - モデルスペック
  - リクエストスペック
  - システムスペック
## DB設計
### ER図
![er](https://user-images.githubusercontent.com/73183707/143767493-17a72f5c-3d8c-4ea7-a444-02f0ee1bfe17.png)

### テーブル
| **テーブル** | **説明** |
| :---     | :---         |
| Users    | ユーザー情報   |
| Posts    | 投稿情報      |
| Maps     | 地図情報      |
| Likes    | いいねの情報   |
| Comments | コメントの情報 |
| Photos   | 投稿写真の情報 |
