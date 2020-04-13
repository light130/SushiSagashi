if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      :provider => 'AWS',
      :region => 'ap-northeast-1',
      :use_iam_profile => true
    }
  end
end
