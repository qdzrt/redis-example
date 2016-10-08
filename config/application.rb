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
    config.app_generators.scaffold_controller :responders_controller

    config.generators do |g|
      g.assets = false
      g.helper = false
      g.test_framework = false
    end

    # Custom directories with classes and modules you want to autoloadable.
    config.autoload_paths.push(*%W(#{config.root}/lib))

    # config.cache_store = :redis_store, {host: '127.0.0.1', port: 6379, namespace: "cache"}
    config.cache_store = :redis_store, 'redis://localhost:6379/0/cache', { expires_in: 90.minutes }
  end
end
