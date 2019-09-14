user = User.create!(
  nickname: 'Example User',
  email: 'aaa@gmail.com',
  password: '123456',
  password_confirmation: '123456'
)

# ソース https://pathee.com/region/tokyo/shibuya/powderroom.html
rooms = [{
  name: '西武 A館 2F 渋谷店',
  rate: 5,
  lat: 35.658230,
  lng: 139.701642,
  user_id: user.id}
# }, {
#   name: '渋谷ちかみちラウンジ',
#   rate: 6,
#   lat: ,
#   lng: ,
#   user_id: user.id
# }, {
#   name: '渋谷ヒカリエShinQs スイッチルーム',
#   rate: 7,
#   lat: ,
#   lng: ,
#   user_id: user.id
# }, {
#   name: '渋谷ヒカリエ B1階',
#   rate: 8,
#   lat: ,
#   lng: ,
#   user_id: user.id
# }, {
#   name: '渋谷ヒカリエ B2階',
#   rate: 9,
#   lat: ,
#   lng: ,
#   user_id: user.id
# }, {
#   name: '東急百貨店 渋谷駅・東横店',
#   rate: 10,
#   lat: ,
#   lng: ,
#   user_id: user.id
# }, {
#   name: '渋谷ヒカリエ 3階',
#   rate: 1,
#   lat: ,
#   lng: ,
#   user_id: user.id
# }, {
#   name: '渋谷109 8階 SBY内',
#   rate: 2,
#   lat: ,
#   lng: ,
#   user_id: user.id
# }, {
#   name: '東急百貨店 3階 本店',
#   rate: 3,
#   lat: ,
#   lng: ,
#   user_id: user.id
# }, {
#   name: '渋谷ヒカリエ 4F',
#   rate: 4,
#   lat: ,
#   lng: ,
#   user_id: user.id
# }, {
#   name: '西武 B館 2階 渋谷店',
#   rate: 5,
#   lat: ,
#   lng: ,
#   user_id: user.id
# }, {
#   name: '渋谷ヒカリエ B3階 ',
#   rate: 6,
#   lat: ,
#   lng: ,
#   user_id: user.id
# }, {
#   name: '渋谷モディ 4階 ',
#   rate: 7,
#   lat: ,
#   lng: ,
#   user_id: user.id
# }, {
#   name: '渋谷モディ 6階 ',
#   rate: 8,
#   lat: ,
#   lng: ,
#   user_id: user.id
# }, {
#   name: '東急百貨店 6階 本店',
#   rate: 9,
#   lat: ,
#   lng: ,
#   user_id: user.id
# }
]

rooms.each do |room|
  PowderRoom.create(
    name: room[:name],
    rate: room[:rate],
    lat: room[:lat],
    lng: room[:lng],
    user_id: room[:user_id]
  )
end
