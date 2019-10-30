require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'create' do
    it '保存できる' do
      expect(build(:review)).to be_valid
    end

    it 'rateなしでは保存できない' do
      review = build(:review, rate: nil)
      review.valid?
      expect(review.errors[:rate]).to include('を入力してください')
    end

    it 'reviewなしでは保存できない' do
      review = build(:review, review: '')
      review.valid?
      expect(review.errors[:review]).to include('を入力してください')
    end

    it 'user_idなしでは保存できない' do
      review = build(:review, user_id: nil)
      review.valid?
      expect(review.errors[:user]).to include('を入力してください')
    end

    it 'powder_room_idなしでは保存できない' do
      review = build(:review, powder_room_id: nil)
      review.valid?
      expect(review.errors[:powder_room]).to include('を入力してください')
    end

    it 'rateが数値ではないと保存できない' do
      review = build(:review, rate: 'a')
      review.valid?
      expect(review.errors[:rate]).to include('は数値で入力してください')
    end

    it 'rateが整数ではないと保存できない' do
      review = build(:review, rate: 1.1)
      review.valid?
      expect(review.errors[:rate]).to include('は整数で入力してください')
    end

    it 'reviewが1000文字以内でないと保存できない' do
      review = build(:review, review: ('a' * 1001).to_s)
      review.valid?
      expect(review.errors[:review]).to include('は1000文字以内で入力してください')
    end

  end
end
