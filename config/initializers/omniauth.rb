Rails.application.config.middleware.use OmniAuth::Builder do
	provider :pocket, ENV['CONSUMER_KEY']#Settings.pocket.consumer_key
end