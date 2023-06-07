source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.1'

gem 'rails', '~> 7.0.4'
gem 'pg'
gem 'puma', '~> 3.12.6'
gem 'sass-rails', '~> 6.0'
gem 'uglifier', '>= 1.9.3'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'bootsnap', '>= 1.1.0', require: false
gem 'faraday'
gem 'figaro' # bundle exec figaro install
# gem 'bootstrap'
gem 'jquery-rails'

group :development, :test do
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry'
  gem 'rspec-rails'
end

group :development do
  gem 'listen'
  gem 'rubocop-rails'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara'
  gem 'launchy' # save_and_open_page
  gem 'orderly'
  gem 'shoulda-matchers'
  gem 'simplecov' # open coverage/index.html
  gem 'vcr'
  gem 'webmock'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
