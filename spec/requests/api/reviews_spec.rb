require 'rails_helper'

RSpec.describe 'Reviews', type: :request do

  let(:room)          { create(:powder_room) }
  let(:current_user)  { create(:user) }
  let(:review_params) { { rate: 5, review: 'テストレビューテストレビュー', powder_room_id: room.id, urls: [nil] } }
  subject             { post(api_user_session_path, params: { email: current_user.email, password: current_user.password }) }

  before do
    subject
    @headers = {
      'uid':          response.headers['uid'],
      'client':       response.headers['client'],
      'access-token': response.headers['access-token']
    }
  end

  it '特定のpowder_roomのreviewを全て取得する' do
    FactoryBot.create_list(:review, 10, powder_room: room)
    get(api_reviews_path, params: { id: room.id })
    json = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(json.length).to eq(10)
  end

  it 'reviewする' do
    expect{ post(api_reviews_path, params: review_params, headers: @headers) }.to change(Review, :count).by(+1)
    expect(response.status).to eq(200)
  end

  it 'ログインしないとreviewできない' do
    post(api_reviews_path, params: review_params)
    expect(response.status).to eq(401)
  end



end