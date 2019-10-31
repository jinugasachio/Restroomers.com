require 'rails_helper'

RSpec.describe 'PowderRoomsAPI', type: :request do

  # it '全てのPowderRoomを取得する' do
  #   FactoryBot.create_list(:powder_room, 10)
  #   get '/api/powder_rooms'
  #   json = JSON.parse(response.body)
  #   expect(response.status).to eq(200)
  #   expect(json.length).to eq(10)
  # end

  it '特定のPowderRoomを取得する' do
    room = create(:powder_room, name: 'テストルーム')
    get "/api/powder_rooms/#{room.id}"
    json = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(json['powder_room']['name']).to eq(room.name)
  end


end
