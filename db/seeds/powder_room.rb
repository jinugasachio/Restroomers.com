user = User.create!(
  nickname: 'Example User',
  email: 'aaa@gmail.com',
  password: '123456',
  password_confirmation: '123456'
)

# ソース https://pathee.com/region/tokyo/shibuya/powderroom.html
rooms = [ {
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
  name: '東急百貨店 渋谷駅・東横店',
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
  lat: 35.6590397,
  lng: 139.69893582,
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
  lat: 35.65720036,
  lng: 139.7029531,
  user_id: user.id
}]

rooms.each do |room|
  PowderRoom.create(
    name: room[:name],
    rate: room[:rate],
    lat: room[:lat],
    lng: room[:lng],
    user_id: room[:user_id]
  )
end
