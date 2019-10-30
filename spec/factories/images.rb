FactoryBot.define do
  factory :image do
    urls { [File.open('db/images/pr1/pr.jpg')] }
    powder_room
  end
end
