# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!
require 'database_cleaner'

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    # json_response_1 = File.read('spec/fixtures/the_godfather.json')
    # stub_request(:get, "https://api.themoviedb.org/3/movie/238?api_key=#{ENV['movie_api_key']}&language=en-US").
    #   to_return(status: 200, body: json_response_1)
    # json_response_2 = File.read('spec/fixtures/shawshank_redemption.json')
    # stub_request(:get, "https://api.themoviedb.org/3/movie/278?api_key=#{ENV['movie_api_key']}&language=en-US").
    #   to_return(status: 200, body: json_response_2)
    # json_response_3 = File.read('spec/fixtures/puss_in_boots.json')
    # stub_request(:get, "https://api.themoviedb.org/3/movie/315162?api_key=#{ENV['movie_api_key']}&language=en-US").
    # to_return(status: 200, body: json_response_3)
    # json_response_4 = File.read('spec/fixtures/the_godfather_credits.json')
    # stub_request(:get, "https://api.themoviedb.org/3/movie/238/credits?api_key=#{ENV['movie_api_key']}&language=en-US").
    #   to_return(status: 200, body: json_response_4)
    # json_response_5 = File.read('spec/fixtures/the_godfather_reviews.json')
    # stub_request(:get, "https://api.themoviedb.org/3/movie/238/reviews?api_key=#{ENV['movie_api_key']}&language=en-US").
    #   to_return(status: 200, body: json_response_5)
    # json_response_6 = File.read('spec/fixtures/top_rated_movies.json')
    # stub_request(:get, "https://api.themoviedb.org/3/discover/movie?api_key=#{ENV['movie_api_key']}&language=en-US&sort_by=vote_average.desc&include_adult=false&include_video=false&page=1&vote_count.gte=1000").
    #   to_return(status: 200, body: json_response_6)
    # json_response_7 = File.read('spec/fixtures/movies_with_green.json')
    # stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['movie_api_key']}&language=en-US&query=Green&page=1&include_adult=false").
    #   to_return(status: 200, body: json_response_7)
    # json_response_8 = File.read('spec/fixtures/the_grand_budapest_hotel.json')
    # stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['movie_api_key']}&language=en-US&query=the%20grand%20budapest%20hotel&page=1&include_adult=false").
    #   to_return(status: 200, body: json_response_8)
    # json_response_9 = File.read('spec/fixtures/movies_with_spider_man.json')
    # stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['movie_api_key']}&language=en-US&query=Spider%20Man&page=1&include_adult=false")
    #   to_return(status: 200, body: json_response_9)
    # json_response_10 = File.read('spec/fixtures/failed_search.json')
    # stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['movie_api_key']}&language=en-US&query=&page=1&include_adult=false").
    #   to_return(status: 200, body: json_response_10)

    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.strategy = :transaction
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end
