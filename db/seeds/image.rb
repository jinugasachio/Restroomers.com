require 'open-uri'

Image.create(
  urls: open("#{Rails.root}/db/images/pr11/pr11-1.jpg"),
  powder_room_id: 11
)
