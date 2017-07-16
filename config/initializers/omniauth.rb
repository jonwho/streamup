Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_OAUTH2_CLIENTID'], ENV['GOOGLE_OAUTH2_SECRET']
end
