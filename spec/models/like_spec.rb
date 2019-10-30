require 'rails_helper'

RSpec.describe Like, type: :model do

  let(:user) { create(:user) }
  let(:room) { create(:powder_room) }

  describe '#create' do
    it '保存できる' do
      expect(build(:like, user_id: user.id, powder_room_id: room.id)).to be_valid
    end

    it 'user_idなしでは保存できない' do
      like = build(:like, user_id: '')
      like.valid?
      expect(like.errors[:user]).to include('を入力してください')
    end

    it 'powder_room_idなしでは保存できない' do
      like = build(:like, powder_room_id: '')
      like.valid?
      expect(like.errors[:powder_room]).to include('を入力してください')
    end
  end
end
