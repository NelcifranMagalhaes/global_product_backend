require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module GlobalProducts
  class Application < Rails::Application
    config.load_defaults 8.0

    config.autoload_lib(ignore: %w[assets tasks])

    config.api_only = true

    # Enable CORS
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*' # Update this to specify allowed origins
        resource '*',
          headers: :any,
          methods: [ :get, :post, :put, :patch, :delete, :options, :head ],
          expose: [ 'Authorization' ],
          max_age: 600
      end
    end
  end
end
