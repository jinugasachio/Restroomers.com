# Restroomers.com

## アプリ概要
**女性用の化粧室(レストルーム)をマップ上から探せるアプリ**です。  
よく使う場所をお気に入りにしたり、新しい場所をマップ上に投稿したりしてみましょう。  
初めての場所、分かりにくい場所へはルート表示機能を使ってみましょう。

#### リンク
[Restroomers.com](https://www.restroomers.com/ "サイトを見る")


## 使用画面サンプル

| トップ | マップ | 検索 |
| :---: | :---: | :---: |
| <img src="https://i.gyazo.com/4e20f6e0fb70683b3eca0be1112ad970.png" width="265px"> | <img src="https://i.gyazo.com/b1ab5a6777da8fb10379cd9042941f93.png" width="265px"> | <img src="https://i.gyazo.com/1697c67daed0f21d064e7041adef2401.png" width="265px"> |  


| 新規投稿 | 投稿フォーム | ルート表示 |
| :---: | :---: | :---: |
| <img src="https://i.gyazo.com/e3414c0196bdc9e10abb78d6f2f3b600.png" width="265px"> | <img src="https://i.gyazo.com/3a4dff5ca8858e9895df859657bef811.png" width="265px"> | <img src="https://i.gyazo.com/a8551577eed47d1a16d6f2ee337c6196.png" width="265px"> |


| ルーム | 設備・詳細 | 口コミ |
| :---: | :---: | :---: |
| <img src="https://i.gyazo.com/e88ba7fb14074d80a3efc8d10d8931ff.png" width="265px"> | <img src="https://i.gyazo.com/3da843e9cc7ec9b837a96d8d82fcc8c3.png" width="265px"> | <img src="https://i.gyazo.com/c1d74dd242c214ba5bb42e2212d2b91b.png" width="265px"> |




# 使用技術
スマートフォンでの使用を想定し、ベースにOnsenUIを用いて**ネイティブアプリを意識したSPA**を作成しました。

### フロントエンド
- Webpack
- Vue.js
  - axios
  - Vuex
  - Vee-validate
  - OnsenUI-framework
- Google API
  - Maps JavaScript
  - Geolocation
  - Directions
  
### バックエンド
- Ruby
- Rails(API)
- RSpec

### インフラストラクチャー
- MySQL
- Docker
- docker-compose
- CircleCI
  - orbs
- AWS
  - ECR/ECS
  - EC2/ALB
  - RDS
  - S3
  - CloudFront
  - Route53
  - ACM
  - VPC
  - CloudWatch


# クラウドアーキテクチャ
![myapp_cloud](https://user-images.githubusercontent.com/49634472/68024489-97753380-fced-11e9-886d-9e288f04789c.png)