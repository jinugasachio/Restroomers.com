shibuya_facilities = [{
  dresser: '-',
  body_mirror: '-',
  makeup_mirror: '-',
  wifi: '-',
  fitting_booth: '-',
  washstands: '-',
  luggage_storage: '-',
  outlet: '-',
  dust_box: '-',
  waiting_sofa: '-',
  rental: '-',
  others: '-',
  powder_room_id: 1
}]

shibuya_facilities.each do |f|
  Facility.create(
    dresser: f[:dresser],
    body_mirror: f[:body_mirror],
    makeup_mirror: f[:makeup_mirror],
    wifi: f[:wifi],
    fitting_booth: f[:fitting_booth],
    washstands: f[:washstands],
    luggage_storage: f[:luggage_storage],
    outlet: f[:outlet],
    dust_box: f[:dust_box],
    waiting_sofa: f[:waiting_sofa],
    rental: f[:rental],
    others: f[:others],
    powder_room_id: f[:powder_room_id]
  )
end
