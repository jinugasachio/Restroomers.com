FactoryBot.define do
  factory :user do
    provider              { 'email' }
    uid                   { Faker::Internet.email }
    password              { '123456' }
    nickname              { 'ugain' }
    email                 { Faker::Internet.email }
  end
end
