require 'rails_helper'

RSpec.describe Image, type: :model do
  describe '#create' do
    it '保存できる' do
      expect(build(:image)).to be_valid
    end

    it 'urlsなしでは保存できない' do
      image = build(:image, urls: nil)
      image.valid?
      expect(image.errors[:urls]).to include('を入力してください')
    end

    it 'powder_room_idなしでは保存できない' do
      image = build(:image, powder_room_id: '')
      image.valid?
      expect(image.errors[:powder_room]).to include('を入力してください')
    end
  end
end
