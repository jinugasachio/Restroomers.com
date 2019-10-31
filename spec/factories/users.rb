FactoryBot.define do
  factory :user do
    provider              { 'email' }
    password              { '123456' }
    nickname              { 'test-user' }
    email                 { Faker::Internet.email }
  end
end
