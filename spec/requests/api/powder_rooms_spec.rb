require 'rails_helper'

RSpec.describe 'PowderRoomsAPI', type: :request do

  it '全てのPowderRoomを取得する' do
    FactoryBot.create_list(:powder_room, 10)
    get '/api/powder_rooms'
    json = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(json['data'].length).to eq(10)
  end


end
