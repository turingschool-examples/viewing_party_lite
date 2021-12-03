# frozen_string_literal: true

# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'
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
  config.include FactoryBot::Syntax::Methods
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

# VCR.configure do |config|
#   config. cassette_library_dir = "spec/fixtures/vcr_cassettes"
#   config.hook_into :webmock
#   config.filter sensitive data('HIDE MY KEY') { ENV ['movies_api_kev'] }
#   config.configure_rspec _metadata!
# end

def movie_data
  {:adult=>false,
 :backdrop_path=>"/mSDsSDwaP3E7dEfUPWy4J0djt4O.jpg",
 :belongs_to_collection=>nil,
 :budget=>19000000,
 :genres=>[{:id=>16, :name=>"Animation"}, {:id=>10751, :name=>"Family"}, {:id=>14, :name=>"Fantasy"}],
 :homepage=>"http://movies.disney.com/spirited-away",
 :id=>129,
 :imdb_id=>"tt0245429",
 :original_language=>"ja",
 :original_title=>"千と千尋の神隠し",
 :overview=>
  "A young girl, Chihiro, becomes trapped in a strange new world of spirits. When her parents undergo a mysterious transformation, she must call upon the courage she never knew she had to free her family.",
 :popularity=>60.365,
 :poster_path=>"/39wmItIWsg5sZMyRUHLkWBcuVCM.jpg",
 :production_companies=>
  [{:id=>10342,
    :logo_path=>"/eS79pslnoKbWg7t3PMA9ayl0bGs.png",
    :name=>"Studio Ghibli",
    :origin_country=>"JP"}],
 :production_countries=>[{:iso_3166_1=>"JP", :name=>"Japan"}],
 :release_date=>"2001-07-20",
 :revenue=>274925095,
 :runtime=>125,
 :spoken_languages=>[{:english_name=>"Japanese", :iso_639_1=>"ja", :name=>"日本語"}],
 :status=>"Released",
 :tagline=>"",
 :title=>"Spirited Away",
 :video=>false,
 :vote_average=>8.5,
 :vote_count=>12107}
end

def other_movie_data
  {:adult=>false,
   :backdrop_path=>"/TU9NIjwzjoKPwQHoHshkFcQUCG.jpg",
   :belongs_to_collection=>nil,
   :budget=>11363000,
   :genres=>[{:id=>35, :name=>"Comedy"}, {:id=>53, :name=>"Thriller"}, {:id=>18, :name=>"Drama"}],
   :homepage=>"https://www.parasite-movie.com/",
   :id=>496243,
   :imdb_id=>"tt6751668",
   :original_language=>"ko",
   :original_title=>"기생충",
   :overview=>
    "All unemployed, Ki-taek's family takes peculiar interest in the wealthy and glamorous Parks for their livelihood until they get entangled in an unexpected incident.",
   :popularity=>71.524,
   :poster_path=>"/7IiTTgloJzvGI1TAYymCfbfl3vT.jpg",
   :production_companies=>
    [{:id=>4399,
      :logo_path=>"/7bWmbWfxFNSGTCjLHkHn3UjspZS.png",
      :name=>"Barunson E&A",
      :origin_country=>"KR"},
     {:id=>7036,
      :logo_path=>"/javbyY0ZCvlFJtly3tpZqf2NwLX.png",
      :name=>"CJ Entertainment",
      :origin_country=>"KR"}],
   :production_countries=>[{:iso_3166_1=>"KR", :name=>"South Korea"}],
   :release_date=>"2019-05-30",
   :revenue=>257591776,
   :runtime=>133,
   :spoken_languages=>
    [{:english_name=>"English", :iso_639_1=>"en", :name=>"English"},
     {:english_name=>"German", :iso_639_1=>"de", :name=>"Deutsch"},
     {:english_name=>"Korean", :iso_639_1=>"ko", :name=>"한국어/조선말"}],
   :status=>"Released",
   :tagline=>"Act like you own the place.",
   :title=>"Parasite",
   :video=>false,
   :vote_average=>8.5,
   :vote_count=>12596}
end

def review_data
  {:author=>"ZeBlah",
  :author_details=>
   {:name=>"ZeBlah",
    :username=>"TheBlah",
    :avatar_path=>"/d7rZv7xFhXHy0OLbVc2byJiZwEU.jpg",
    :rating=>10.0},
  :content=>
   "One of the great \"masters\" of the anime art. Somehow, if I would personally associate \"Akira\" to \"self-destruction\", then this anime would be the opposite :)",
  :created_at=>"2019-06-29T20:24:51.877Z",
  :id=>"5d17c91385702e001eb921db",
  :updated_at=>"2021-06-23T15:58:23.763Z",
  :url=>"https://www.themoviedb.org/review/5d17c91385702e001eb921db"}
end

def cast_data
  {:adult=>false,
  :gender=>1,
  :id=>19587,
  :known_for_department=>"Acting",
  :name=>"Rumi Hiiragi",
  :original_name=>"Rumi Hiiragi",
  :popularity=>2.799,
  :profile_path=>"/zITaVtFyc4xSM3mxSoPRWHbqgJI.jpg",
  :cast_id=>3,
  :character=>"Chihiro Ogino / Sen (voice)",
  :credit_id=>"52fe421bc3a36847f8004a97",
  :order=>0}
end

def viewing_party_data
  {"duration_of_party"=>"195",
  "day"=>"2021-12-03",
  "start_time"=>"20:06"}
end

def other_viewing_party_data
  {"duration_of_party"=>"200",
  "day"=>"2020-11-01",
  "start_time"=>"19:42"}
end
