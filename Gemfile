source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'rails', '~> 6.0.0'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'mini_magick'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'slim-rails'
gem 'html2slim'
gem 'bootstrap'
gem "jquery-rails"
gem 'devise'
gem 'devise-i18n'
gem 'devise-i18n-views'
gem 'carrierwave', '~> 2.0'
gem 'fog-aws'
gem 'font-awesome-sass', '~> 5.9.0'
gem 'gmaps4rails'
gem 'ransack'
gem 'paperclip'
gem "webpacker"
gem 'rails_best_practices'
gem 'rubocop', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring-commands-rspec'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'launchy'
  gem 'selenium-webdriver'
  gem 'webdrivers', require: !ENV['SELENIUM_REMOTE_URL']
  gem 'shoulda-matchers'
  gem 'vcr'
  gem 'webmock'
  gem 'rspec-rails'
end
