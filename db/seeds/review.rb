reviews = [ 
  'いつも利用してます。お気に入りの場所。',
  '設備がかなり充実しています',
  '清潔感のある空間、とても気に入っています',
  'もっとアメニティ系を充実させて欲しいです',
  'いつ行っても混んでるので、結構外で待つことが多いです。
  時間的余裕がある時はおすすめです',
  'ドライヤーがあったら嬉しい！！！',
  'もっと駅から近かったら最高なのになぁー',
  '写真で見るより狭い。荷物置きスペースがもっと広い方がいい。',
  '職場の近くなので、重宝しています。仕事終わりに遊びに行く時いつも使っています',
  '場所がわかりにくいので注意してください！',
  '会員制でもおかしくないくらい',
  '鏡が大きいので嬉しいです。化粧ブースは隣の人とのスペースが広いので、心置きなく化粧直しできます！最高！',
  '内装が可愛いのでテンション上がります'
]

70.times do
  Review.create(
    rate: rand(2..5),
    review: reviews.sample,
    user_id: rand(3..22),
    powder_room_id: rand(1..25),
    created_at:Faker::Time.between(from: DateTime.now - 2, to: DateTime.now),
    updated_at: Faker::Time.between(from: DateTime.now - 2, to: DateTime.now)
  )
end
