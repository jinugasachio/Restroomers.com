require 'rails_helper'

RSpec.describe 'PowderRoomsAPI', type: :request do

  let(:current_user) { create(:user) }
  let(:room_params)  { { room: { room_params: { name: 'テストルーム', lat: 35.66019636, lng: 139.70036142 }, images_params: { urls: [nil] } } } }
  subject            { post(api_user_session_path, params: { email: current_user.email, password: current_user.password }) }

  before do
    subject
    @headers = {
      'uid':          response.headers['uid'],
      'client':       response.headers['client'],
      'access-token': response.headers['access-token']
    }
  end

  it '全てのpowder_roomを取得する' do
    FactoryBot.create_list(:powder_room, 10)
    get api_powder_rooms_path
    json = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(json.length).to eq(10)
  end

  it '特定のpowder_roomを取得する' do
    room = create(:powder_room, name: 'テストルーム')
    get "/api/powder_rooms/#{room.id}"
    json = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(json['powder_room']['name']).to eq(room.name)
  end

  it '新しいpowder_roomを投稿する' do
    expect { post(api_powder_rooms_path, params: room_params, headers: @headers) }.to change(PowderRoom, :count).by(+1)
    expect(response.status).to eq(200)
  end

  it 'ログインしていないと投稿できない' do
    post(api_powder_rooms_path, params: room_params)
    expect(response.status).to eq(401)
  end
end
