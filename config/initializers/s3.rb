CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => Rails.application.secrets.amazon_access_key_id,
      :aws_secret_access_key  => Rails.application.secrets.amazon_secret_access_key,
      :region                 => 'us-east-1' # Change this for different AWS region. Default is 'us-east-1'
  }
  config.fog_directory  = "nomadgorails"
end