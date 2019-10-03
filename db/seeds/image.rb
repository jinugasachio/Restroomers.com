

image_dir_array = ['./db/images/pr1/*']
urls = []
image_dir_array.each.with_index(1) do |dir, n|
  Dir.glob(dir).each do |image|
    urls.push(File.open(image))
  end
  Image.create(urls: urls, powder_room_id: n)
end
