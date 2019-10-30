require 'rails_helper'

RSpec.describe PowderRoom, type: :model do

  describe '#create' do
    it '投稿できる' do
      expect(build(:powder_room)).to be_valid
    end

    it '名前がないと投稿できない' do
      room = build(:powder_room, name: '')
      room.valid?
      expect(room.errors[:name]).to include('を入力してください。')
    end


  end
end
