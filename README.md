# Restroomers.com<img src="https://user-images.githubusercontent.com/49634472/68065579-b23bbc80-fd6e-11e9-947b-f48931f5fc17.png" width="25px" style="position: absolute !important; top: 136px; left: 314px;">


## アプリ概要
**女性用の化粧室(レストルーム)をマップ上から探せるアプリ**です。  
よく使う場所をお気に入りにしたり、新しい場所をマップ上に投稿したりしてみましょう。  
初めての場所、分かりにくい場所へはルート表示機能を使ってみましょう。

### リンク
[Restroomers.com](https://www.restroomers.com/ "サイトを見る")


## 使用画面サンプル
| 左寄せ | 中央寄せ | 右寄せ |
| :---: | :---: | :---: |
| <img src="https://i.gyazo.com/4e20f6e0fb70683b3eca0be1112ad970.png" width="265px"> | <img src="https://i.gyazo.com/e88ba7fb14074d80a3efc8d10d8931ff.png" width="265px"> | <img src="https://i.gyazo.com/e0b9941f13fea7d2ff396c9d63e1f273.png" width="265px"> |
#### サインイン / サインアップ
<div>
  <img src="https://i.gyazo.com/4e20f6e0fb70683b3eca0be1112ad970.png" width="240px" hspace="25">
  <img src="https://i.gyazo.com/e88ba7fb14074d80a3efc8d10d8931ff.png" width="240px" hspace="25">
  <img src="https://i.gyazo.com/e0b9941f13fea7d2ff396c9d63e1f273.png" width="240px" hspace="25">
</div>

<div>
  <img src="https://i.gyazo.com/4e20f6e0fb70683b3eca0be1112ad970.png" width="240px" hspace="25" vspace="40">
  <img src="https://i.gyazo.com/e88ba7fb14074d80a3efc8d10d8931ff.png" width="240px" hspace="25" vspace="40">
  <img src="https://i.gyazo.com/e0b9941f13fea7d2ff396c9d63e1f273.png" width="240px" hspace="25" vspace="40">
</div>


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
