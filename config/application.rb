require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RedisExample
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Use the responders controller from the responders gem
    config.app_generators.scaffold_controller :responders_controller

    config.generators do |g|
      g.assets = false
      g.helper = false
      g.test_framework = false
    end
    config.cache_store = :redis_store, { host: '127.0.0.1', port: 6379, namespace: 'rails365'}
  end
end
