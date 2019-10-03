require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test?
    config.storage= :file
  else
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ,
      aws_secret_access_key: ,
      region: ,
      host:
    }

    # cacheもS3に置く
    config.cache_storage = :fog
    config.cache_dir = 'tmp/image-cache'

    config.fog_directory  = 

    config.asset_host = 
  end
end