CarrierWave.configure do |config|
  config.storage = :file

  # Use S3 if you want
  config.storage = :fog
  config.fog_credentials = {
    provider:               'AWS',
    region:                 ENV.fetch('AWS_REGION'),
    aws_access_key_id:      ENV.fetch('AWS_ACCESS_KEY_ID'),
    aws_secret_access_key:  ENV.fetch('AWS_SECRET_ACCESS_KEY')
  }
  config.fog_directory  = ENV.fetch('S3_BUCKET_NAME')
  config.fog_public     = true
  config.fog_attributes = { 'Cache-Control' => 'max-age=315576000' }

  config.enable_processing = !Rails.env.test?
end