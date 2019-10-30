FactoryBot.define do
  factory :facility do
    dresser         { '-' }
    body_mirror     { '-' }
    makeup_mirror   { '-' }
    wifi            { '-' }
    fitting_booth   { '-' }
    washstands      { '-' }
    luggage_storage { '-' }
    outlet          { '-' }
    dust_box        { '-' }
    waiting_space   { '-' }
    others          { '-' }
    membership      { 'なし' }
    rate_plan       { '無料' }
    powder_room
  end
end
