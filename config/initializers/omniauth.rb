Rails.application.config.middleware.use OmniAuth::Builder do
  # Using Rails build in credentials.yml.enc file for encrypted credentials.
  provider :developer unless Rails.env.production?
  provider :github, Rails.application.credentials.github[:key], Rails.application.credentials.github[:secret]
end
