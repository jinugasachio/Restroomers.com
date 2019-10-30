FactoryBot.define do
  factory :review do
    rate           { 5 }
    review         { ('a' * 1000).to_s }
    user_id        { 1 }
    powder_room_id { 1 }
  end
end
