Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV["ARM_TWITTER_CONSUMER_KEY"], ENV["ARM_TWITTER_CONSUMER_SECRET"]
  #provider :facebook, "app_id", "app_secret" 
end
