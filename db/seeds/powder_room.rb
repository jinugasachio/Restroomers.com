user = User.create(
  nickname: 'テストユーザー',
  email: 'test@gmail.com',
  password: '123456',
  password_confirmation: '123456'
)

20.times do
  User.create(
    nickname: Faker::Japanese::Name.name,
    email:    Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password'
  )
end

shibuya_parent = [{
  name: '西武渋谷店 A館 2F',
  lat: 35.66019636,
  lng: 139.70036142,
  user_id: user.id
}, {
  name: '西武渋谷店 B館 2F',
  lat: 35.66074499,
  lng: 139.70018908,
  user_id: user.id
}, {
  name: '渋谷ヒカリエShinQs',
  lat: 35.65902499,
  lng: 139.70347278,
  user_id: user.id
}, {
  name: '東急百貨店 東横店',
  lat: 35.65872207,
  lng: 139.70083818,
  user_id: user.id
}, {
  name: '東急百貨店 本店',
  lat: 35.66063929,
  lng: 139.69601691,
  user_id: user.id
}, {
  name: '渋谷109 8階 SBY',
  lat: 35.65957145,
  lng: 139.69875008,
  user_id: user.id
}, {
  name: '渋谷モディ',
  lat: 35.66162649,
  lng: 139.70050693,
  user_id: user.id
}, {
  name: '渋谷ちかみちラウンジ',
  lat: 35.65954067,
  lng: 139.69962582,
  user_id: user.id
}, {
  name: 'DHCコミュニケーションスペース',
  lat: 35.65903916,
  lng: 139.69893263,
  user_id: user.id
}, {
  name: '渋谷マルイ 4F',
  lat: 35.66090679,
  lng: 139.70107153,
  user_id: user.id
}, {
  name: '渋谷ストリーム 2F',
  lat: 35.65719927,
  lng: 139.70295377,
  user_id: user.id
}]

shibuya_children = [{
  name: '5F Relax STAGE',
  lat: shibuya_parent[2][:lat],
  lng: shibuya_parent[2][:lng],
  user_id: user.id,
  ancestry: '3'
}, {
  name: '4F Accent STAGE',
  lat: shibuya_parent[2][:lat],
  lng: shibuya_parent[2][:lng],
  user_id: user.id,
  ancestry: '3'
}, {
  name: '3F Style up STAGE',
  lat: shibuya_parent[2][:lat],
  lng: shibuya_parent[2][:lng],
  user_id: user.id,
  ancestry: '3'
}, {
  name: 'B1F Beauty presentation STAGE',
  lat: shibuya_parent[2][:lat],
  lng: shibuya_parent[2][:lng],
  user_id: user.id,
  ancestry: '3'
}, {
  name: "B2F Mammy's STAGE",
  lat: shibuya_parent[2][:lat],
  lng: shibuya_parent[2][:lng],
  user_id: user.id,
  ancestry: '3'
}, {
  name: 'B3F Open STAGE',
  lat: shibuya_parent[2][:lat],
  lng: shibuya_parent[2][:lng],
  user_id: user.id,
  ancestry: '3'
}, {
  name: '南館 5F',
  lat: shibuya_parent[3][:lat],
  lng: shibuya_parent[3][:lng],
  user_id: user.id,
  ancestry: '4'
}, {
  name: '南館 4F',
  lat: shibuya_parent[3][:lat],
  lng: shibuya_parent[3][:lng],
  user_id: user.id,
  ancestry: '4'
}, {
  name: '南館 B1F',
  lat: shibuya_parent[3][:lat],
  lng: shibuya_parent[3][:lng],
  user_id: user.id,
  ancestry: '4'
}, {
  name: '6F',
  lat: shibuya_parent[4][:lat],
  lng: shibuya_parent[4][:lng],
  user_id: user.id,
  ancestry: '5'
}, {
  name: '3F',
  lat: shibuya_parent[4][:lat],
  lng: shibuya_parent[4][:lng],
  user_id: user.id,
  ancestry: '5'
}, {
  name: '6F',
  lat: shibuya_parent[6][:lat],
  lng: shibuya_parent[6][:lng],
  user_id: user.id,
  ancestry: '7'
}, {
  name: '4F',
  lat: shibuya_parent[6][:lat],
  lng: shibuya_parent[6][:lng],
  user_id: user.id,
  ancestry: '7'
}, {
  name: '南館 6F',
  lat: shibuya_parent[3][:lat],
  lng: shibuya_parent[3][:lng],
  user_id: user.id,
  ancestry: '4'
}]

shibuya_parent.each do |room|
  PowderRoom.create(
    name: room[:name],
    lat: room[:lat],
    lng: room[:lng],
    user_id: room[:user_id]
  )
end

shibuya_children.each do |room|
  PowderRoom.create(
    name: room[:name],
    lat: room[:lat],
    lng: room[:lng],
    user_id: room[:user_id],
    ancestry: room[:ancestry]
  )
end
