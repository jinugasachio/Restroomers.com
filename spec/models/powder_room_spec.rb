require 'rails_helper'

RSpec.describe PowderRoom, type: :model do

  describe '#create' do
    it '投稿できる' do
      expect(build(:powder_room)).to be_valid
    end

    it 'nameなしでは投稿できない' do
      room = build(:powder_room, name: '')
      room.valid?
      expect(room.errors[:name]).to include('を入力してください')
    end

    it 'latなしでは投稿できない' do
      room = build(:powder_room, lat: '')
      room.valid?
      expect(room.errors[:lat]).to include('を入力してください')
    end

    it 'lngなしでは投稿できない' do
      room = build(:powder_room, lng: '')
      room.valid?
      expect(room.errors[:lng]).to include('を入力してください')
    end

    it 'user_idなしでは投稿できない' do
      room = build(:powder_room, user: nil)
      room.valid?
      expect(room.errors[:user]).to include('を入力してください')
    end

    it 'latが数値以外では投稿できない' do
      room = build(:powder_room, lat: 'アイウエオ')
      room.valid?
      expect(room.errors[:lat]).to include('は数値で入力してください')
    end

    it 'lngが数値以外では投稿できない' do
      room = build(:powder_room, lng: 'アイウエオ')
      room.valid?
      expect(room.errors[:lng]).to include('は数値で入力してください')
    end
  end
  
end
