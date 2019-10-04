# powder_roomの数と.timesの数字は等しい
# 本番と開発で条件分岐しないといけない

# image_dir_array = []
# 25.times do |num|
#   image_dir_array.push("./db/images/pr#{num + 1}/*")
# end

# image_dir_array.each.with_index(1) do |dir, n|
#   files = []
#   Dir.glob(dir).each do |image|
#     files.push(File.open(image))
#   end
#   Image.create(urls: files, powder_room_id: n)
# end

# require 'aws-sdk'

# image_dir_array = []
# 25.times do |num|
#   image_dir_array.push("./db/images/pr#{num + 1}/*")
# end

# image_dir_array.each.with_index(1) do |dir, n|
#   files = []
#   Dir.glob(dir).each do |image|
#     files.push(File.open(image))
#   end
#   Image.create(urls: files, powder_room_id: n)
# end

access_key_id = Rails.application.credentials.production[:aws][:access_key_id]
secret_access_key = Rails.application.credentials.production[:aws][:secret_access_key]
region = Rails.application.credentials.production[:aws][:s3_region]
bucket = Rails.application.credentials.production[:aws][:s3_backet]

s3 = Aws::S3::Resource.new(
  access_key_id: access_key_id,
  secret_access_key: secret_access_key,
  region: region
)



data = s3.bucket(bucket).objects#("uploads/image/urls/1/pr1-1.jpg")

binding.pry

t = data.get(response_target)

binding.pry

puts "これはないは"
