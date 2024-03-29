require_relative 'boot'

require 'rails/all'
require 'csv'
require 'carrierwave'
require 'carrierwave/orm/activerecord'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Aps
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.time_zone = 'America/Bogota'
    config.i18n.available_locales = [:en, :es]
    config.i18n.default_locale = :es
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]

    config.generators do |g|
      g.test_framework :rspec,
                       request_specs: true,
                       view_specs: true,
                       routing_specs: true,
                       helper_specs: true,
                       controller_specs: true
    end


    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
