source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap'
gem 'carrierwave', '~> 2.0'
gem 'coffee-rails'
gem 'devise'
gem 'devise-i18n'
gem 'devise-i18n-views'
gem 'fog-aws'
gem 'font-awesome-sass', '~> 5.9.0'
gem 'gmaps4rails'
gem 'html2slim'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'mini_magick'
gem 'paperclip'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'rails', '~> 6.0.0'
gem 'ransack'
gem 'sass-rails', '~> 5.0'
gem 'slim-rails'
gem 'turbolinks', '~> 5'
gem 'tzinfo-data'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker'

group :development, :test do
  gem 'byebug'
  gem 'factory_bot_rails'
  gem 'pry-rails'
  gem 'rails_best_practices'
  gem 'rubocop', require: false
  gem 'solargraph'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'launchy'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'vcr'
  gem 'webdrivers', require: !ENV['SELENIUM_REMOTE_URL']
  gem 'webmock'
end
