require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Myapp
  class Application < Rails::Application

    config.load_defaults 6.0

    config.i18n.default_locale = :ja

    config.generators do |generator|
      generator.test_frameword = "rspec",
      generator.helper_specs = false,
      generator.view_specs = false,
      generator.routing_specs = false,
      generator.request_specs = false
    end

  end
end
