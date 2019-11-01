FactoryBot.define do
  factory :review do
    rate           { 5 }
    review         { ('a' * 1000).to_s }
    user
    powder_room
  end
end
