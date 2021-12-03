# frozen_string_literal: true

# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'
require 'webmock/rspec'

# Add additional requires below this line. Rails is not loaded until this point!

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

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
  config.filter_sensitive_data('HIDE MY KEY') { ENV['movie_api_key'] }
  config.configure_rspec_metadata!
  config.default_cassette_options = { re_record_interval: 30.days }
end

def movie_data
  {:adult=>false,
 :backdrop_path=>"/dK12GIdhGP6NPGFssK2Fh265jyr.jpg",
 :belongs_to_collection=>nil,
 :budget=>200000000,
 :genres=>[{:id=>28, :name=>"Action"}, {:id=>35, :name=>"Comedy"}, {:id=>80, :name=>"Crime"}, {:id=>53, :name=>"Thriller"}],
 :homepage=>"https://www.netflix.com/us/title/81161626",
 :id=>512195,
 :imdb_id=>"tt7991608",
 :original_language=>"en",
 :original_title=>"Red Notice",
 :overview=>
  "An Interpol-issued Red Notice is a global alert to hunt and capture the world's most wanted. But when a daring heist brings together the FBI's top profiler and two rival criminals, there's no telling what will happen.",
 :popularity=>3981.915,
 :poster_path=>"/wdE6ewaKZHr62bLqCn7A2DiGShm.jpg",
 :production_companies=>
  [{:id=>34081, :logo_path=>nil, :name=>"Flynn Picture Company", :origin_country=>"US"},
   {:id=>73669, :logo_path=>"/7tmSGstK3KwgcDIuBYLTAayjit9.png", :name=>"Seven Bucks Productions", :origin_country=>"US"},
   {:id=>923, :logo_path=>"/5UQsZrfbfG2dYJbx8DxfoTr2Bvu.png", :name=>"Legendary Pictures", :origin_country=>"US"},
   {:id=>102182, :logo_path=>nil, :name=>"Bad Version, Inc.", :origin_country=>""}],
 :production_countries=>[{:iso_3166_1=>"US", :name=>"United States of America"}],
 :release_date=>"2021-11-04",
 :revenue=>0,
 :runtime=>116,
 :spoken_languages=>
  [{:english_name=>"English", :iso_639_1=>"en", :name=>"English"},
   {:english_name=>"Italian", :iso_639_1=>"it", :name=>"Italiano"},
   {:english_name=>"Russian", :iso_639_1=>"ru", :name=>"Pусский"}],
 :status=>"Released",
 :tagline=>"Pro and cons.",
 :title=>"Red Notice",
 :video=>false,
 :vote_average=>6.8,
 :vote_count=>1659}
end
