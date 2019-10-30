require 'rails_helper'

RSpec.describe PowderRoom, type: :model do

  let(:user) { create(:user) }

  describe '#create' do
    it '保存できる' do
      expect(build(:powder_room, user_id: user.id)).to be_valid
    end

    it 'nameなしでは保存できない' do
      room = build(:powder_room, name: '')
      room.valid?
      expect(room.errors[:name]).to include('を入力してください')
    end

    it 'latなしでは保存できない' do
      room = build(:powder_room, lat: '')
      room.valid?
      expect(room.errors[:lat]).to include('を入力してください')
    end

    it 'lngなしでは保存できない' do
      room = build(:powder_room, lng: '')
      room.valid?
      expect(room.errors[:lng]).to include('を入力してください')
    end

    it 'user_idなしでは保存できない' do
      room = build(:powder_room, user: nil)
      room.valid?
      expect(room.errors[:user]).to include('を入力してください')
    end

    it 'latが数値以外では保存できない' do
      room = build(:powder_room, lat: 'アイウエオ')
      room.valid?
      expect(room.errors[:lat]).to include('は数値で入力してください')
    end

    it 'lngが数値以外では保存できない' do
      room = build(:powder_room, lng: 'アイウエオ')
      room.valid?
      expect(room.errors[:lng]).to include('は数値で入力してください')
    end
  end
  
end
