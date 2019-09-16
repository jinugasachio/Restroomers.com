# seedファイルを分割して実行するためのタスク
# 例： db/seeds/powder_room.rbを実行する時 $ rake db:seed:powder_room
Dir.glob(File.join(Rails.root, 'db', 'seeds', '*.rb')).each do |file|
  desc "Load the seed data from db/seeds/#{File.basename(file)}."
  task "db:seed:#{File.basename(file).gsub(/\..+$/, '')}" => :environment do
    load(file)
  end
end