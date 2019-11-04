# Restroomers.com
<br/>

## アプリ概要
&nbsp; **女性用の化粧室(レストルーム)をマップ上から探せるアプリ**です。  
よく使う場所をお気に入りにしたり、新しい場所をマップ上に投稿したりしてみましょう。  
初めての場所、分かりにくい場所へはルート表示機能を使ってみましょう。
<br/>
<br/>

## 作成した経緯
&nbsp; 渋谷駅の女子トイレの洗面台の前に、多くの人が化粧直しのために並んでいる光景を目にしました。その光景を不憫に思ってしまい、そういった渋谷女子の問題を解決できるかつ自分が女性だったら欲しいなと思うアプリを考えた結果、作成しました。
<br/>
<br/>


## リンク
[Restroomers.com](https://www.restroomers.com/ "サイトを見る")
<br/>
<br/>
<br/>


## 使用画面サンプル
<br/>

| 新規登録/ログイン| トップ | 検索機能 |
| :---: | :---: | :---: |
| <img src="https://i.gyazo.com/4e20f6e0fb70683b3eca0be1112ad970.png" width="265px"> | <img src="https://i.gyazo.com/b1ab5a6777da8fb10379cd9042941f93.png" width="265px"> | <img src="https://i.gyazo.com/1697c67daed0f21d064e7041adef2401.png" width="265px"> |  
<br/>
<br/>
<br/>

| 新規投稿 | 投稿フォーム | ルート表示 |
| :---: | :---: | :---: |
| <img src="https://i.gyazo.com/e3414c0196bdc9e10abb78d6f2f3b600.png" width="265px"> | <img src="https://i.gyazo.com/3a4dff5ca8858e9895df859657bef811.png" width="265px"> | <img src="https://i.gyazo.com/a8551577eed47d1a16d6f2ee337c6196.png" width="265px"> |
<br/>
<br/>
<br/>

| ルーム | 設備・詳細 | 口コミ |
| :---: | :---: | :---: |
| <img src="https://i.gyazo.com/e88ba7fb14074d80a3efc8d10d8931ff.png" width="265px"> | <img src="https://i.gyazo.com/3da843e9cc7ec9b837a96d8d82fcc8c3.png" width="265px"> | <img src="https://i.gyazo.com/c1d74dd242c214ba5bb42e2212d2b91b.png" width="265px"> |
<br/>
<br/>
<br/>



# 使用技術
&nbsp; スマートフォンでの使用を想定し、ベースにOnsenUIを用いて**ネイティブアプリを意識したSPA**を作成しました。

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
<br/>
<br/>


# クラウドアーキテクチャ
![myapp_cloud](https://user-images.githubusercontent.com/49634472/68024489-97753380-fced-11e9-886d-9e288f04789c.png)
