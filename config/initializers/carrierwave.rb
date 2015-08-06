CarrierWave.configure do |config|
  config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     '----------------',                        # required
      aws_secret_access_key: '===============',                        # required
      endpoint:              'cookie-pics.s3-website-us-east-1.amazonaws.com' # optional, defaults to nil
  }
  config.fog_directory  = 'cookie-pics'                          # required
  config.fog_public     = false                                        # optional, defaults to true
end