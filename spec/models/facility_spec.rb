require 'rails_helper'

RSpec.describe Facility, type: :model do

  let(:room) { create(:powder_room) }

  describe '#create' do
    it '保存できる' do
      expect(build(:facility, powder_room_id: room.id)).to be_valid
    end

    it 'dresserなしでは保存できない' do
      facility = build(:facility, dresser: '')
      facility.valid?
      expect(facility.errors[:dresser]).to include('を入力してください')
    end

    it 'body_mirrorなしでは保存できない' do
      facility = build(:facility, body_mirror: '')
      facility.valid?
      expect(facility.errors[:body_mirror]).to include('を入力してください')
    end

    it 'makeup_mirrorなしでは保存できない' do
      facility = build(:facility, makeup_mirror: '')
      facility.valid?
      expect(facility.errors[:makeup_mirror]).to include('を入力してください')
    end

    it 'wifiなしでは保存できない' do
      facility = build(:facility, wifi: '')
      facility.valid?
      expect(facility.errors[:wifi]).to include('を入力してください')
    end

    it 'fitting_boothなしでは保存できない' do
      facility = build(:facility, fitting_booth: '')
      facility.valid?
      expect(facility.errors[:fitting_booth]).to include('を入力してください')
    end

    it 'washstandsなしでは保存できない' do
      facility = build(:facility, washstands: '')
      facility.valid?
      expect(facility.errors[:washstands]).to include('を入力してください')
    end

    it 'luggage_storageなしでは保存できない' do
      facility = build(:facility, luggage_storage: '')
      facility.valid?
      expect(facility.errors[:luggage_storage]).to include('を入力してください')
    end

    it 'outletなしでは保存できない' do
      facility = build(:facility, outlet: '')
      facility.valid?
      expect(facility.errors[:outlet]).to include('を入力してください')
    end

    it 'dust_boxなしでは保存できない' do
      facility = build(:facility, dust_box: '')
      facility.valid?
      expect(facility.errors[:dust_box]).to include('を入力してください')
    end

    it 'waiting_spaceなしでは保存できない' do
      facility = build(:facility, waiting_space: '')
      facility.valid?
      expect(facility.errors[:waiting_space]).to include('を入力してください')
    end

    it 'membershipなしでは保存できない' do
      facility = build(:facility, membership: '')
      facility.valid?
      expect(facility.errors[:membership]).to include('を入力してください')
    end

    it 'rate_planなしでは保存できない' do
      facility = build(:facility, rate_plan: '')
      facility.valid?
      expect(facility.errors[:rate_plan]).to include('を入力してください')
    end

    it 'othersなしでは保存できない' do
      facility = build(:facility, others: '')
      facility.valid?
      expect(facility.errors[:others]).to include('を入力してください')
    end

    it 'membershipがあり、なし以外では保存できない' do
      facility = build(:facility, membership: '○')
      facility.valid?
      expect(facility.errors[:membership]).to include('は不正な値です')
    end

    it 'rate_planが無料、有料以外では保存できない' do
      facility = build(:facility, rate_plan: '○')
      facility.valid?
      expect(facility.errors[:rate_plan]).to include('は不正な値です')
    end

    it 'othersが400文字以内でないと保存できない' do
      facility = build(:facility, others: ('a' * 401).to_s)
      facility.valid?
      expect(facility.errors[:others]).to include('は400文字以内で入力してください')
    end

  end
end
