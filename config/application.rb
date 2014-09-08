require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
require 'multi_json'
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
    config.assets.precompile += %w( admin.css main_page.js admin.js pr_pub.js)
    MultiJson.use :yajl
    # ActiveRecordQueryTrace.enabled = true
    # ActiveRecordQueryTrace.level = :full
    # ActiveRecordQueryTrace.lines = -1
  end
end
