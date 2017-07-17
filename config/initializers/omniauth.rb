OmniAuth.config.full_host = Rails.env.production? ? 'https://jonwho-streamup.herokuapp.com' : 'http://localhost:3000'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
    ENV['GOOGLE_OAUTH2_CLIENTID'],
    ENV['GOOGLE_OAUTH2_SECRET']
    #{
      #client_options: {
        #ssl: {
          #ca_file: '/usr/lib/ssl/certs/ca-certificates.crt'
        #}
      #}
    #}
end
