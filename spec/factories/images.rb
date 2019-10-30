FactoryBot.define do
  factory :image do
    powder_room_id { 1 }
    urls           { [File.open('db/images/pr1/pr.jpg')] }
  end
end
