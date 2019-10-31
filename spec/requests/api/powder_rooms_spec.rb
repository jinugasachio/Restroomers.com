require 'rails_helper'

RSpec.describe 'PowderRoomsAPI', type: :request do

  # it '全てのpowder_roomを取得する' do
  #   FactoryBot.create_list(:powder_room, 10)
  #   get '/api/powder_rooms'
  #   json = JSON.parse(response.body)
  #   expect(response.status).to eq(200)
  #   expect(json.length).to eq(10)
  # end

  # it '特定のpowder_roomを取得する' do
  #   room = create(:powder_room, name: 'テストルーム')
  #   get "/api/powder_rooms/#{room.id}"
  #   json = JSON.parse(response.body)
  #   expect(response.status).to eq(200)
  #   expect(json['powder_room']['name']).to eq(room.name)
  # end

  it '新しいpowder_roomを作成する' do
    valid_params = { room: { room_params: { name: 'テストルーム', lat: 35.66019636, lng: 139.70036142 } } }
    expect { post '/api/powder_rooms', params: valid_params }.to change(PowderRoom, :count).by(+1)
    expect(response.status).to eq(200)
  end

end
