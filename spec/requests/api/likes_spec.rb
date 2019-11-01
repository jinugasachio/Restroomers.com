require 'rails_helper'

RSpec.describe 'Likes', type: :request do

  let(:room)         { create(:powder_room) }
  let(:current_user) { create(:user) }
  let(:like_params)  { { powder_room_id: room.id } }
  subject            { post(api_user_session_path, params: { email: current_user.email, password: current_user.password }) }

  before do
    subject
    @headers = {
      'uid':          response.headers['uid'],
      'client':       response.headers['client'],
      'access-token': response.headers['access-token']
    }
  end

  it 'likeできる' do
    expect { post(api_likes_path, params: like_params, headers: @headers) }.to change(Like, :count).by(+1)
    expect(response.status).to eq(200)
  end

  it 'unlikeできる' do
    post(api_likes_path, params: like_params, headers: @headers)
    json = JSON.parse(response.body)
    expect { delete("/api/likes/#{json['id']}", headers: @headers) }.to change(Like, :count).by(-1)
    expect(response.status).to eq(200)
  end

  it 'ユーザーのお気に入りの部屋を出力できる' do
    post(api_likes_path, params: like_params, headers: @headers)
    like = JSON.parse(response.body)
    room_id = like['powder_room_id']
    get(favorite_rooms_api_likes_path, headers: @headers)
    room = JSON.parse(response.body)
    expect(room[0]['id']).to eq(room_id)
    expect(response.status).to eq(200)
  end

  it 'ログインしていないとlikeできない' do
    post(api_likes_path, params: like_params)
    expect(response.status).to eq(401)
  end

  it 'ログインしていないとunlikeできない' do
    delete("/api/likes/#{room.id}")
    expect(response.status).to eq(401)
  end

  it 'ログインしていないとお気に入りの部屋を出力できない' do
    get(favorite_rooms_api_likes_path )
    expect(response.status).to eq(401)
  end

end