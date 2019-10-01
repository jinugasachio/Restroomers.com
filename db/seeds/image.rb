require 'open-uri'

Image.create(
  urls: [File.open("#{Rails.root}/db/images/pr11/pr11-1.jpg"),
         File.open("#{Rails.root}/db/images/pr11/pr11-2.jpg"),
         File.open("#{Rails.root}/db/images/pr11/pr11-3.jpg"),],
  powder_room_id: 11
)

Image.create(
  urls: [File.open("#{Rails.root}/db/images/pr11/pr11-2.jpg"),
         File.open("#{Rails.root}/db/images/pr11/pr11-3.jpg"),],
  powder_room_id: 8
)
