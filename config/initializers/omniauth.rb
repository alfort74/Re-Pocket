Rails.application.config.middleware.use OmniAuth::Builder do
	provider :pocket, Settings.pocket.consumer_key
end