shibuya_details = [{
  open: '10:00',
  close: '21:00',
  phone_number: '03-3462-0111',
  address: '東京都渋谷区宇田川町21-1 西武渋谷店A館 2F',
  official_url: 'https://www.sogo-seibu.jp/shibuya/floor_guide/',
  membership: 0,
  rate_plan: '無料',
  powder_room_id: 1
}]

rooms = PowderRoom.all

rooms.each_with_index do |r, num|
  d = shibuya_details[num]
  detail = r.build_detail(
    open: d[:open],
    close: d[:close],
    phone_number: d[:phone_number],
    address: d[:address],
    official_url: d[:official_url],
    membership: d[:membership],
    rate_plan: d[:rate_plan]
  )
  detail.save
end

# shibuya_details.each do |d|
#   Detail.create(
    # open: d[:open],
    # close: d[:close],
    # phone_number: d[:phone_number],
    # address: d[:address],
    # official_url: d[:official_url],
    # membership: d[:membership],
    # powder_room_id: d[:powder_room_id],
    # rate_plan: d[:rate_plan],
#   )
# end
