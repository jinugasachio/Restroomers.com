FactoryBot.define do
  factory :powder_room do
    name     { '渋谷テストルーム' }
    lat      { 35.66019636 }
    lng      { 139.70036142 }
    ancestry { nil }
    user
  end
end
