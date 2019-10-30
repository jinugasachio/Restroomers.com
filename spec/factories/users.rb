FactoryBot.define do
  factory :user do
    provider              { 'email' }
    uid                   { 'testtesttest@gmail.com' }
    password              { '123456' }
    nickname              { 'ugain' }
    email                 { 'testtesttest@gmail.com' }
  end
end
