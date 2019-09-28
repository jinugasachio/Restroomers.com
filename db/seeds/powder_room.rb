user = User.create!(
  nickname: '管理人',
  email: 'aaa@gmail.com',
  password: '123456',
  password_confirmation: '123456'
)

shibuya_parent = [{
  name: '西武渋谷店 A館 2F',
  rate: 0,
  lat: 35.66019636,
  lng: 139.70036142,
  user_id: user.id
}, {
  name: '西武渋谷店 B館 2F',
  rate: 0,
  lat: 35.66074499,
  lng: 139.70018908,
  user_id: user.id
}, {
  name: '渋谷ヒカリエShinQs',
  rate: 0,
  lat: 35.65902499,
  lng: 139.70347278,
  user_id: user.id
}, {
  name: '東急百貨店 東横店',
  rate: 0,
  lat: 35.65872207,
  lng: 139.70083818,
  user_id: user.id
}, {
  name: '東急百貨店 本店',
  rate: 0,
  lat: 35.66063929,
  lng: 139.69601691,
  user_id: user.id
}, {
  name: '渋谷109 8階 SBY',
  rate: 0,
  lat: 35.65957145,
  lng: 139.69875008,
  user_id: user.id
}, {
  name: '渋谷モディ',
  rate: 0,
  lat: 35.66162649,
  lng: 139.70050693,
  user_id: user.id
}, {
  name: '渋谷ちかみちラウンジ',
  rate: 0,
  lat: 35.65954067,
  lng: 139.69962582,
  user_id: user.id
}, {
  name: 'DHCコミュニケーションスペース',
  rate: 0,
  lat: 35.65903916,
  lng: 139.69893263,
  user_id: user.id
}, {
  name: '渋谷マルイ 4F',
  rate: 0,
  lat: 35.66090679,
  lng: 139.70107153,
  user_id: user.id
}, {
  name: '渋谷ストリーム 2F',
  rate: 0,
  lat: 35.65719927,
  lng: 139.70295377,
  user_id: user.id
}]

shibuya_children = [{
  name: '5F Relax STAGE',
  rate: 0,
  lat: shibuya_parent[2][:lat],
  lng: shibuya_parent[2][:lng],
  user_id: user.id,
  ancestry: '3'
}, {
  name: '4F Accent STAGE',
  rate: 0,
  lat: shibuya_parent[2][:lat],
  lng: shibuya_parent[2][:lng],
  user_id: user.id,
  ancestry: '3'
}, {
  name: '3F Style up STAGE',
  rate: 0,
  lat: shibuya_parent[2][:lat],
  lng: shibuya_parent[2][:lng],
  user_id: user.id,
  ancestry: '3'
}, {
  name: 'B1F Beauty presentation STAGE',
  rate: 0,
  lat: shibuya_parent[2][:lat],
  lng: shibuya_parent[2][:lng],
  user_id: user.id,
  ancestry: '3'
}, {
  name: "B2F Mammy's STAGE",
  rate: 0,
  lat: shibuya_parent[2][:lat],
  lng: shibuya_parent[2][:lng],
  user_id: user.id,
  ancestry: '3'
}, {
  name: 'B3F Open STAGE',
  rate: 0,
  lat: shibuya_parent[2][:lat],
  lng: shibuya_parent[2][:lng],
  user_id: user.id,
  ancestry: '3'
}, {
  name: '南館 5F',
  rate: 0,
  lat: shibuya_parent[3][:lat],
  lng: shibuya_parent[3][:lng],
  user_id: user.id,
  ancestry: '4'
}, {
  name: '南館 4F',
  rate: 0,
  lat: shibuya_parent[3][:lat],
  lng: shibuya_parent[3][:lng],
  user_id: user.id,
  ancestry: '4'
}, {
  name: '南館 B1F',
  rate: 0,
  lat: shibuya_parent[3][:lat],
  lng: shibuya_parent[3][:lng],
  user_id: user.id,
  ancestry: '4'
}, {
  name: '6F',
  rate: 0,
  lat: shibuya_parent[4][:lat],
  lng: shibuya_parent[4][:lng],
  user_id: user.id,
  ancestry: '5'
}, {
  name: '3F',
  rate: 0,
  lat: shibuya_parent[4][:lat],
  lng: shibuya_parent[4][:lng],
  user_id: user.id,
  ancestry: '5'
}, {
  name: '6F',
  rate: 0,
  lat: shibuya_parent[6][:lat],
  lng: shibuya_parent[6][:lng],
  user_id: user.id,
  ancestry: '7'
}, {
  name: '4F',
  rate: 0,
  lat: shibuya_parent[6][:lat],
  lng: shibuya_parent[6][:lng],
  user_id: user.id,
  ancestry: '7'
}]

shibuya_parent.each do |room|
  PowderRoom.create(
    name: room[:name],
    rate: room[:rate],
    lat: room[:lat],
    lng: room[:lng],
    user_id: room[:user_id]
  )
end

shibuya_children.each do |room|
  PowderRoom.create(
    name: room[:name],
    rate: room[:rate],
    lat: room[:lat],
    lng: room[:lng],
    user_id: room[:user_id],
    ancestry: room[:ancestry]
  )
end

