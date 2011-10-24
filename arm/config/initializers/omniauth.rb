Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "CONSUMER_KEY", "CONSUMER_SECRET" # FIXME
  #provider :facebook, "app_id", "app_secret" 
end
