user = User.create(
  nickname: 'Example User',
  email: 'aaa@gmail.com',
  password: '123456',
  password_confirmation: '123456'
)

rooms = [{
  name: '渋谷駅',
  rate: 5,
  lat: 35.658230,
  lng: 139.701642,
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
