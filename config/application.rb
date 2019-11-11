require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module HelpEvent
  class Application < Rails::Application
    config.load_defaults 5.2
    Time::DATE_FORMATS[:default] = "%d/%m/%Y %H:%M"
    Date::DATE_FORMATS[:default] = "%d/%m/%Y"
    config.i18n.default_locale = :"pt-BR"


    config.time_zone = 'La Paz'
  end
end
