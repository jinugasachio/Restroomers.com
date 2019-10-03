

# image_dir_array = ['./db/images/pr1/*', './db/images/pr2/*']

image_dir_array = []
25.times do |num|
  image_dir_array.push("./db/images/pr#{num + 1}/*")
end

image_dir_array.each.with_index(1) do |dir, n|
  files = []
  Dir.glob(dir).each do |image|
    files.push(File.open(image))
  end
  Image.create(urls: files, powder_room_id: n)
end
