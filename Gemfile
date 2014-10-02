ruby "2.1.0"
source 'http://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails'

# Use postgresql as the database for Active Record
gem 'pg'

# if bigger then everything breaks
gem 'sprockets', '= 2.11.0'
# gem 'sprockets'
gem 'compass-rails'
gem 'sassy-buttons'
group :assets do
  gem 'turbo-sprockets-rails3'

end
# gem 'sprockets-rails'


# Use SCSS for stylesheets
gem 'sass-rails', '= 4.0.2'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
#gem 'therubyracer', platforms: :ruby
gem 'node'

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'

gem 'haml-rails'

# Turbolinks makes following links in your web application faster. Read more:
# gem 'turbolinks'
# gem 'jquery-turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'

gem 'devise'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-vkontakte'
gem 'cancan'
gem 'geocoder'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development, :test do
  # gem 'debugger'
  gem 'byebug'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'rspec-rails', '~> 2.0'
  gem 'guard', '>=2.1.0'
  gem 'guard-rspec'
  gem 'rb-inotify', :require => false
  gem 'rb-fsevent', :require => false
  gem 'rb-fchange', :require => false
end

group :test do
  gem 'libnotify'# if /linux/ =~ RUBY_PLATFORM
  # gem 'growl' if /darwin/ =~ RUBY_PLATFORM
  gem 'capybara'
end

group :development do
  gem 'guard-livereload'
  gem 'meta_request'
  #gem 'boson-more'
  gem 'irbtools', '~> 1.5.0', :require => false
  gem 'irbtools-more', :require => false
end

#gem 'anjlab-bootstrap-rails', :require => 'bootstrap-rails',
#                              :github => 'anjlab/bootstrap-rails'

# gem 'bootstrap-sass'

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
gem 'unicorn'

# Use Capistrano for deployment
group :development do
  gem 'capistrano', '~> 2.0', require: false
  # gem 'capistrano-rails',   '~> 1.1', require: false
  # gem 'capistrano-bundler', '~> 1.1', require: false
  gem 'net-ssh', '~> 2.7.0'
end
#gem 'rvm-capistrano'
gem 'thin'
#gem 'puma', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'rails_12factor', group: :production

# gem 'susy'
# gem 'compass'
# gem 'compass-rails'
# gem 'sassy-buttons'

gem 'nokogiri'

gem 'whenever', :require => false

gem 'best_in_place', :git => "https://github.com/bernat/best_in_place"

gem 'carrierwave'
gem 'carrierwave-dropbox'

gem 'plupload-rails'

gem 'mini_magick'
gem 'carrierwave-processing'

gem 'newrelic_rpm'
gem 'skylight'

#gem 'activemerchant', :require => 'active_merchant'
#gem 'robokassa'
gem 'prawn', :git => "https://github.com/prawnpdf/prawn.git"

gem 'faye'
gem 'private_pub'

gem 'oj'
gem 'yajl-ruby'
# gem 'psych', '~> 2.0.5'
gem 'bootsy'

# to store session in db
gem 'activerecord-session_store', github: 'rails/activerecord-session_store'

# just for tabs :)
gem 'bettertabs'



# i like that kind of names
gem 'active_record_query_trace'

# forum
gem 'forem', :github => "mib32/forem", :branch => "rails4"
gem 'forem-bootstrap', github: "radar/forem-bootstrap"
gem 'kaminari', '0.15.1'

# this is for SORTING LISTS
gem 'acts_as_list'


gem 'rails-bootstrap-toggle-buttons'

gem 'jbuilder_cache_multi'

