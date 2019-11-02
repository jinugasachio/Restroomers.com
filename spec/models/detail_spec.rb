require 'rails_helper'

RSpec.describe Detail, type: :model do

  let(:room) { create(:powder_room) }
  
  describe '#create' do
    it '保存できる' do
      expect(build(:detail, powder_room_id: room.id)).to be_valid
    end

    it 'phone_numberが11桁でも保存できる' do
      detail = build(:detail, phone_number: '01234567890', powder_room_id: room.id)
      expect(detail).to be_valid
    end

    it 'powder_room_idなしでは保存できない' do
      detail = build(:detail, powder_room: nil)
      detail.valid?
      expect(detail.errors[:powder_room]).to include('を入力してください')
    end

    it 'official_urlがurl形式でないと保存できない' do
      detail = build(:detail, official_url: 'アイウエオ')
      detail.valid?
      expect(detail.errors[:official_url]).to include('は不正な値です')
    end


  end
end
