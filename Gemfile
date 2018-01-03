source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0.beta2'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

gem 'nokogiri'
gem 'pry-rails'
gem 'dotenv-rails'

group :production do
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rubocop', require: false
  gem 'rubocop-rspec', require: false
  gem 'spring-commands-rspec'
  gem 'spring-commands-rubocop'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'faker'

  gem "capybara", "~> 2.6"
  gem "coveralls", "~> 0.7", require: false
  gem "rack-test", "~> 0.6"
  gem "rspec-html-matchers", "~> 0.7"
  gem "timecop", "~> 0.8"
end

gem "delayed_job", "~> 4.1"
gem "delayed_job_active_record", "~> 4.1"
gem "feedbag", "~> 0.9.5"
gem "feedjira", "~> 2.1.0"
gem "loofah", "~> 2.0"
gem "rack-protection", "~> 1.5"
gem "rack-ssl", "~> 1.4"
gem "thread", "~> 0.2"
gem "will_paginate", "~> 3.1"

group :test do
  gem 'shoulda-matchers'
end
