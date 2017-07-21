require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ProyectoSW2017
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.i18n.enforce_available_locales = false

    config.i18n.available_locales = ['es-CL', :es]

    config.i18n.default_locale = :es

    config.time_zone = 'America/Santiago'

    config.autoload_paths << Rails.root.join('services')
  end
end
