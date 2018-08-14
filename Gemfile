source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
gem 'webpacker'
gem 'devise'
gem 'bootstrap-sass'
gem 'faker'
gem 'bootsnap'
gem 'rake'
gem 'puma'
gem 'rubocop'
gem 'sass-rails'
gem 'uglifier'
gem 'turbolinks'
gem 'jbuilder'
gem 'mail'
gem 'json'
gem 'omniauth'

group :development, :test do
  gem 'byebug',  '9.0.6', platform: :mri
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'database_cleaner'
  gem "factory_bot_rails"
  gem 'simplecov'
  gem 'dotenv-rails'
end

group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem 'letter_opener'
  gem 'web-console'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
end

group :test do
  gem 'capybara'
  gem 'poltergeist'
  gem 'shoulda-matchers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
