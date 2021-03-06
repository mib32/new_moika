require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
require 'multi_json'
require 'emoji'
require 'breakpoint'
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Moika
  class Application < Rails::Application
    config.autoload_paths += %W(#{config.root}/app/models/banners)

    config.i18n.enforce_available_locales = true
    config.i18n.locale = :ru
    config.i18n.default_locale = :ru
    config.autoload_paths += Dir["#{config.root}/lib", "#{config.root}/lib/**/"]
    config.assets.precompile += %w( admin.css admin.js pr_pub.js forem.js map_general.js map_general_lite.js mobile.css mobile.js)
    config.assets.paths << Emoji.images_path
    MultiJson.use :yajl

    config.railties_order = [:main_app,Forem::Engine, :all]
    # ActiveRecordQueryTrace.enabled = true
    # ActiveRecordQueryTrace.level = :app
    # ActiveRecordQueryTrace.lines = 5

    config.middleware.use "Rack::RequestProfiler"

    config.time_zone = 'Moscow'
    # config.active_record.default_timezone = :local
    # config.active_record.initialize_timezone
  end
end
