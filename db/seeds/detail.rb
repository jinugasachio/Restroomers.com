shibuya_parent_details = [{
  open:         '10:00',
  close:        '21:00(日・祝日は20:00)',
  phone_number: '0334620111',
  address:      '東京都渋谷区宇田川町21-1 西武渋谷店A館 2F',
  official_url: 'https://www.sogo-seibu.jp/shibuya/floor_guide/',
}, {
  open:         '10:00',
  close:        '21:00(日・祝日は20:00)',
  phone_number: '0334620111',
  address:      '東京都渋谷区宇田川町21-1 西武渋谷店B館 2F',
  official_url: 'https://www.sogo-seibu.jp/shibuya/floor_guide/index_b.html',
}, {
  open:         '10:00',
  close:        '21:00',
  phone_number: '0334611090',
  address:      '東京都渋谷区渋谷2-21-1',
  official_url: 'https://www.tokyu-dept.co.jp/shinqs/about/panorama.html',
}, {
  open:         '10:00',
  close:        '21:00',
  phone_number: '0334773111',
  address:      '東京都渋谷区渋谷2-24-1',
  official_url: 'https://www.tokyu-dept.co.jp/toyoko/',
}, {
  open:         '10:00',
  close:        '21:00',
  phone_number: '0334773111',
  address:      '東京都渋谷区道玄坂2-24-1',
  official_url: 'https://www.tokyu-dept.co.jp/honten/',
}, {
  open:         '10:00',
  close:        '21:00',
  phone_number: '0334775163',
  address:      '東京都渋谷区道玄坂 2-29-1 SHIBUYA109-8F',
  official_url: 'https://shop.sby.co.jp/',
}, {
  open:         '11:00',
  close:        '21:00',
  phone_number: '0334640101',
  address:      '東京都渋谷区神南1-21-3',
  official_url: 'https://www.0101.co.jp/721/',
}, {
  open:         '10:00',
  close:        '20:00',
  phone_number: '0354585143',
  address:      '東京都渋谷区5 道玄坂2-5-9 渋谷駅構内 出口4番隣',
  official_url: 'https://www.tokyu.co.jp/shibuyachikamichi/lounge/',
}, {
  open:         '10:00',
  close:        '19:30(土曜日は18:00)',
  phone_number: '0120055979',
  address:      '東京都渋谷区道玄坂2-6-17 渋東シネタワー12Ｆ',
  official_url: 'https://www.dhc-cs.com/',
}, {
  open:         '11:00',
  close:        '21:00(日・祝は20:30)',
  phone_number: '0334640101',
  address:      '東京都渋谷区神南1-22-6 渋谷マルイ 4F',
  official_url: 'https://www.0101.co.jp/013/?from=01_pc_top_search_store',
}, {
  open:         '10:00',
  close:        '21:00',
  phone_number: '0570050428',
  address:      '東京都渋谷区渋谷三丁目21-3',
  official_url: 'https://shibuyastream.jp/',
}]

# 共通のchildrenは同じdetailを当てるようにする
rooms = PowderRoom.where(id: 1..25)

rooms.each_with_index do |room, num|
  d = shibuya_parent_details[num]
  if room.parent.present?
    parent_detail_hash = room.parent.detail.attributes
    parent_detail_hash.delete('id')
    detail = room.build_detail(parent_detail_hash)
  else
    detail = room.build_detail(
      open:         d[:open],
      close:        d[:close],
      phone_number: d[:phone_number],
      address:      d[:address],
      official_url: d[:official_url],
    )
  end
  detail.save
end


others = PowderRoom.where(id: 26..75)

others.each do |room|
  detail = room.build_detail(
    open:         '10:00',
    close:        '21:00',
    phone_number: '0312345678',
    address:      '東京都テスト区テスト町123-4',
    official_url: 'https://www.restroomers.com/',
  )
  detail.save
end