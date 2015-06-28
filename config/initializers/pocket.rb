require 'pocket'

Pocket.configure do |config|
	config.consumer_key = Settings.pocket.consumer_key
end