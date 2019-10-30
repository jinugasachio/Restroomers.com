FactoryBot.define do
  factory :detail do
    open           { '10:00' }
    close          { '21:00' }
    phone_number   { '0345678901' }
    address        { '東京都渋谷区宇田川町21-1 西武渋谷店A館 2F' }
    official_url   { 'https://www.sogo-seibu.jp/shibuya/floor_guide/' }
    powder_room_id { 1 }
  end
end
