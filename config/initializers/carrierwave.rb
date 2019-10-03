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
      aws_access_key_id: Rails.application.credentials.production[:aws][:access_key_id],
      aws_secret_access_key: Rails.application.credentials.production[:aws][:secret_access_key],
      region: Rails.application.credentials.production[:aws][:s3_region],
      host: Rails.application.credentials.production[:aws][:s3_host]
    }

    # cacheもS3に置く
    config.cache_storage = :fog
    config.cache_dir = 'tmp/image-cache'

    config.fog_directory = Rails.application.credentials.production[:aws][:s3_backet]

    config.asset_host = Rails.application.credentials.production[:aws][:fog_asset_host]
  end
end
