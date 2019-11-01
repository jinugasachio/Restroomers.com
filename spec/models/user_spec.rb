require 'rails_helper'

RSpec.describe User, type: :model do
  it '保存できる' do
    expect(build(:user)).to be_valid
  end

  it 'providerなしでは保存できない' do
    user = build(:user, provider: '')
    user.valid?
    expect(user.errors[:provider]).to include('を入力してください')
  end

  it 'passwordなしでは保存できない' do
    user = build(:user, password: '')
    user.valid?
    expect(user.errors[:password]).to include('を入力してください')
  end

  it 'nicknameなしでは保存できない' do
    user = build(:user, nickname: '')
    user.valid?
    expect(user.errors[:nickname]).to include('を入力してください')
  end

  it 'emailなしでは保存できない' do
    user = build(:user, email: '')
    user.valid?
    expect(user.errors[:email]).to include('を入力してください')
  end

  it 'passwordが6文字以上でないと保存できない' do
    user = build(:user, password: '12345')
    user.valid?
    expect(user.errors[:password]).to include('は6文字以上で入力してください')
  end

  it 'passwordが128文字以内でないと保存できない' do
    user = build(:user, password: ('1' * 129).to_s)
    user.valid?
    expect(user.errors[:password]).to include('は128文字以内で入力してください')
  end

  it 'nicknameが20文字以内でないと保存できない' do
    user = build(:user, nickname: ('1' * 21).to_s)
    user.valid?
    expect(user.errors[:nickname]).to include('は20文字以内で入力してください')
  end

  it 'emailに一意性がないと保存できない' do
    user = create(:user)
    another_user = build(:user, email: user.email)
    another_user.valid?
    expect(another_user.errors[:email]).to include('はすでに存在します')
  end

  it 'emailがメールアドレス形式でないと保存できない' do
    user = build(:user, email: 'asdfghjkl;')
    user.valid?
    expect(user.errors[:email]).to include('は不正な値です')
  end

end
