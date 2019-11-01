reviews = [ 
  'いつも利用してます。お気に入りの場所。',
  '設備がかなり充実しています',
  '清潔感のある空間、とても気に入っています',
  'もっとアメニティ系を充実させて欲しいです',
  'いつ行っても混んでるので、結構外で待つことが多いです。時間的余裕がある時はおすすめです',
  'ドライヤーがあったら嬉しい！！！',
  'もっと駅から近かったら最高なのになぁー',
  '写真で見るより狭い。荷物置きスペースがもっと広い方がいい。',
  '職場の近くなので、重宝しています。仕事終わりに遊びに行く時いつも使っています',
  '場所がわかりにくいので注意してください！',
  '会員制でもおかしくないくらい',
  '鏡が大きいので嬉しいです。化粧ブースは隣の人とのスペースが広いので、心置きなく化粧直しできます！最高！',
  '内装が可愛いのでテンション上がります',
  '出勤前にいつも利用してます',
  'とても綺麗なのでテンション上がります',
  '比較的利用している年齢層は高く、マダムが多いです。',
  '先日始めで利用しましたが、リピーターになること間違いなしです。'
]

200.times do
  Review.create(
    rate:           rand(2..5),
    review:         reviews.sample,
    user_id:        rand(3..22),
    powder_room_id: rand(1..75),
    created_at:     Faker::Time.between(from: DateTime.now - 2, to: DateTime.now),
    updated_at:     Faker::Time.between(from: DateTime.now - 2, to: DateTime.now)
  )
end

user_like = [1, 2, 8, 10, 11, 12, 13, 14, 15, 16]

5.times do
  Like.create(
    user_id: 1,
    powder_room_id: user_like.sample
  )
end

200.times do
  Like.create(
    user_id: rand(2..20),
    powder_room_id: rand(1..75)
  )
end
