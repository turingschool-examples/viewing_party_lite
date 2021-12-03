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

def movie_cast
  {
    "id": 512195,
    "cast": [
        {
            "adult": false,
            "gender": 2,
            "id": 18918,
            "known_for_department": "Acting",
            "name": "Dwayne Johnson",
            "original_name": "Dwayne Johnson",
            "popularity": 41.871,
            "profile_path": "/kuqFzlYMc2IrsOyPznMd1FroeGq.jpg",
            "cast_id": 2,
            "character": "John Hartley",
            "credit_id": "5aac343892514116b7004626",
            "order": 0
        },
        {
            "adult": false,
            "gender": 2,
            "id": 10859,
            "known_for_department": "Acting",
            "name": "Ryan Reynolds",
            "original_name": "Ryan Reynolds",
            "popularity": 44.448,
            "profile_path": "/4SYTH5FdB0dAORV98Nwg3llgVnY.jpg",
            "cast_id": 13,
            "character": "Nolan Booth",
            "credit_id": "5d23cf7069d2800010011045",
            "order": 1
        },
        {
            "adult": false,
            "gender": 1,
            "id": 90633,
            "known_for_department": "Acting",
            "name": "Gal Gadot",
            "original_name": "Gal Gadot",
            "popularity": 28.695,
            "profile_path": "/fysvehTvU6bE3JgxaOTRfvQJzJ4.jpg",
            "cast_id": 9,
            "character": "Sarah Black / The Bishop",
            "credit_id": "5b1ea4290e0a261010008a2d",
            "order": 2
        },
        {
            "adult": false,
            "gender": 1,
            "id": 1742596,
            "known_for_department": "Acting",
            "name": "Ritu Arya",
            "original_name": "Ritu Arya",
            "popularity": 33.2,
            "profile_path": "/ihrpR4DeBgxYgpU7b1I0tFKckm1.jpg",
            "cast_id": 16,
            "character": "Inspector Urvashi Das",
            "credit_id": "5e4204000c271000137fe6fd",
            "order": 3
        },
        {
            "adult": false,
            "gender": 2,
            "id": 1217648,
            "known_for_department": "Acting",
            "name": "Chris Diamantopoulos",
            "original_name": "Chris Diamantopoulos",
            "popularity": 4.56,
            "profile_path": "/t1jxWnGMkCTJ8kpvxdHlxNhlBt5.jpg",
            "cast_id": 17,
            "character": "Sotto Voce",
            "credit_id": "5e42040b41465c0018ce67e2",
            "order": 4
        },
        {
            "adult": false,
            "gender": 2,
            "id": 2777637,
            "known_for_department": "Acting",
            "name": "Ivan Mbakop",
            "original_name": "Ivan Mbakop",
            "popularity": 2.118,
            "profile_path": "/6X8bfrpJlDJUIQj9nt5IV1HfQGM.jpg",
            "cast_id": 20,
            "character": "Tambwe",
            "credit_id": "5f5f9fc493388b00395b9a43",
            "order": 5
        },
        {
            "adult": false,
            "gender": 2,
            "id": 20588,
            "known_for_department": "Acting",
            "name": "Vincenzo Amato",
            "original_name": "Vincenzo Amato",
            "popularity": 2.407,
            "profile_path": "/h1cwmBKjFxGgIX4RcPhdcjJGpBa.jpg",
            "cast_id": 87,
            "character": "Director Gallo",
            "credit_id": "618f9669e93e95008ea04bf9",
            "order": 6
        },
        {
            "adult": false,
            "gender": 2,
            "id": 1507080,
            "known_for_department": "Acting",
            "name": "Rafael Petardi",
            "original_name": "Rafael Petardi",
            "popularity": 1.912,
            "profile_path": "/1ychureLvmyTVYYKI41pN13efFr.jpg",
            "cast_id": 25,
            "character": "Security Chief Ricci",
            "credit_id": "60e836994ca676005e1d0096",
            "order": 7
        },
        {
            "adult": false,
            "gender": 2,
            "id": 1039097,
            "known_for_department": "Acting",
            "name": "Seth Michaels",
            "original_name": "Seth Michaels",
            "popularity": 1.613,
            "profile_path": null,
            "cast_id": 88,
            "character": "Souvenir Stand Owner",
            "credit_id": "618f968a66a7c30092d34cb5",
            "order": 8
        },
        {
            "adult": false,
            "gender": 0,
            "id": 2045045,
            "known_for_department": "Acting",
            "name": "Sebastien Large",
            "original_name": "Sebastien Large",
            "popularity": 0.6,
            "profile_path": null,
            "cast_id": 89,
            "character": "Gelato Truck Driver",
            "credit_id": "618f969863e6fb0063733f7e",
            "order": 9
        },
        {
            "adult": false,
            "gender": 2,
            "id": 1517535,
            "known_for_department": "Acting",
            "name": "Guy Nardulli",
            "original_name": "Guy Nardulli",
            "popularity": 0.6,
            "profile_path": null,
            "cast_id": 90,
            "character": "Museum Reporter / Italian VIP",
            "credit_id": "618f96aad55e4d0045bc651a",
            "order": 10
        },
        {
            "adult": false,
            "gender": 2,
            "id": 2646853,
            "known_for_department": "Acting",
            "name": "Andrew Hunter",
            "original_name": "Andrew Hunter",
            "popularity": 0.6,
            "profile_path": "/qo257KJR4WpjHrQfnEeUY3JdZ2P.jpg",
            "cast_id": 91,
            "character": "Moped Tourist",
            "credit_id": "618f96bca313b8002a9c645c",
            "order": 11
        },
        {
            "adult": false,
            "gender": 2,
            "id": 1822373,
            "known_for_department": "Acting",
            "name": "George Tsai",
            "original_name": "George Tsai",
            "popularity": 0.6,
            "profile_path": "/4l05ulUteEk6Gdp2opdHlnfzvtn.jpg",
            "cast_id": 92,
            "character": "Bali Van Driver",
            "credit_id": "618f96c65f2b8d0026662899",
            "order": 12
        },
        {
            "adult": false,
            "gender": 2,
            "id": 57633,
            "known_for_department": "Directing",
            "name": "Rawson Marshall Thurber",
            "original_name": "Rawson Marshall Thurber",
            "popularity": 6.032,
            "profile_path": "/4gpzB12oy73qr5nWNNyZICz9nFB.jpg",
            "cast_id": 93,
            "character": "Exhausted Film Director in Bar",
            "credit_id": "618f96d666a7c30064c17fa6",
            "order": 13
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1723574,
            "known_for_department": "Acting",
            "name": "Anthony Belevtsov",
            "original_name": "Anthony Belevtsov",
            "popularity": 1.246,
            "profile_path": "/8oghqsjK6Pyvc1r9Zndilgl3EOV.jpg",
            "cast_id": 86,
            "character": "Prison Guard Sergeant",
            "credit_id": "6186dcba75f1ad008e4209d0",
            "order": 14
        },
        {
            "adult": false,
            "gender": 2,
            "id": 9452,
            "known_for_department": "Acting",
            "name": "Daniel Bernhardt",
            "original_name": "Daniel Bernhardt",
            "popularity": 6.745,
            "profile_path": "/b59qhg5VJOCypx9eMXrXHAjauLd.jpg",
            "cast_id": 85,
            "character": "Drago Grande",
            "credit_id": "6186dc6d8ed03f006373e765",
            "order": 15
        },
        {
            "adult": false,
            "gender": 0,
            "id": 3148386,
            "known_for_department": "Acting",
            "name": "Yosef Podolski",
            "original_name": "Yosef Podolski",
            "popularity": 0.6,
            "profile_path": null,
            "cast_id": 94,
            "character": "Lead Guard",
            "credit_id": "618f96eba313b8006254f88e",
            "order": 16
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1233178,
            "known_for_department": "Acting",
            "name": "Alexander Perkins",
            "original_name": "Alexander Perkins",
            "popularity": 0.631,
            "profile_path": "/aJ3uqgRXPW0Jvxp6MbgQS8vLfBL.jpg",
            "cast_id": 95,
            "character": "Intelligence Analyst",
            "credit_id": "618f979166a7c30043755655",
            "order": 17
        },
        {
            "adult": false,
            "gender": 2,
            "id": 1157627,
            "known_for_department": "Acting",
            "name": "Joseph A. Garcia",
            "original_name": "Joseph A. Garcia",
            "popularity": 0.84,
            "profile_path": "/kaNFRoFLjHxeEVntTSrb5xeRPW.jpg",
            "cast_id": 102,
            "character": "Old Tech",
            "credit_id": "61903a147ac8290061d8bf3e",
            "order": 18
        },
        {
            "adult": false,
            "gender": 2,
            "id": 1970046,
            "known_for_department": "Acting",
            "name": "Nathan Theis",
            "original_name": "Nathan Theis",
            "popularity": 0.722,
            "profile_path": "/wUhiaVclV1urgNpopDhvdS31pRR.jpg",
            "cast_id": 96,
            "character": "Young Tech",
            "credit_id": "618f97a50f2fbd002e474470",
            "order": 19
        },
        {
            "adult": false,
            "gender": 0,
            "id": 2156029,
            "known_for_department": "Visual Effects",
            "name": "Gonzalo Escudero",
            "original_name": "Gonzalo Escudero",
            "popularity": 0.6,
            "profile_path": null,
            "cast_id": 97,
            "character": "Head Waiter",
            "credit_id": "618f97b288634800437a2284",
            "order": 20
        },
        {
            "adult": false,
            "gender": 2,
            "id": 200109,
            "known_for_department": "Acting",
            "name": "Tom Choi",
            "original_name": "Tom Choi",
            "popularity": 2.286,
            "profile_path": "/48uNKlsPufa5NMcaFGYv01ZbGXA.jpg",
            "cast_id": 27,
            "character": "Mongolian Captain",
            "credit_id": "60e8374d4ca67600462a0d9d",
            "order": 21
        },
        {
            "adult": false,
            "gender": 2,
            "id": 1952010,
            "known_for_department": "Acting",
            "name": "Nick Arapoglou",
            "original_name": "Nick Arapoglou",
            "popularity": 1.22,
            "profile_path": "/3ZM2dRRRFrz1nLsshETs6egpKYX.jpg",
            "cast_id": 98,
            "character": "Officer on Yacht",
            "credit_id": "618f97d6cf62cd002a01f41d",
            "order": 22
        },
        {
            "adult": false,
            "gender": 2,
            "id": 35172,
            "known_for_department": "Acting",
            "name": "Robert Clotworthy",
            "original_name": "Robert Clotworthy",
            "popularity": 0.833,
            "profile_path": "/ya6d3Nkp28AYIQ9TFDfwh8lshxg.jpg",
            "cast_id": 99,
            "character": "Opening Narrator (voice)",
            "credit_id": "618f97e3cf62cd00421f5eb8",
            "order": 23
        },
        {
            "adult": false,
            "gender": 2,
            "id": 1199292,
            "known_for_department": "Acting",
            "name": "Martin Harris",
            "original_name": "Martin Harris",
            "popularity": 1.4,
            "profile_path": "/3CRHqBr5U8pexQdtB42P0ZzK9x0.jpg",
            "cast_id": 101,
            "character": "Tower Guard",
            "credit_id": "61903976f18ce7008acccc06",
            "order": 24
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1915018,
            "known_for_department": "Acting",
            "name": "Ethan Herschenfeld",
            "original_name": "Ethan Herschenfeld",
            "popularity": 0.6,
            "profile_path": null,
            "cast_id": 103,
            "character": "Aranoub Magdy",
            "credit_id": "61903ab8e93e95008ea13147",
            "order": 25
        },
        {
            "adult": false,
            "gender": 2,
            "id": 998387,
            "known_for_department": "Acting",
            "name": "Ed Sheeran",
            "original_name": "Ed Sheeran",
            "popularity": 3.002,
            "profile_path": "/w7zbWC9AV0WfIEl8L38otal7mwS.jpg",
            "cast_id": 100,
            "character": "Ed Sheeran (uncredited)",
            "credit_id": "618fb9770f2fbd002e475f89",
            "order": 26
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1773168,
            "known_for_department": "Acting",
            "name": "Steve Eifert",
            "original_name": "Steve Eifert",
            "popularity": 0.84,
            "profile_path": "/2cmouno9Lz9hVuQvrb350epJZw9.jpg",
            "cast_id": 104,
            "character": "Prison Captain",
            "credit_id": "61915d5c63a69500618d7ed4",
            "order": 27
        }
    ],
    "crew": [
        {
            "adult": false,
            "gender": 2,
            "id": 9543,
            "known_for_department": "Production",
            "name": "Beau Flynn",
            "original_name": "Beau Flynn",
            "popularity": 2.959,
            "profile_path": null,
            "credit_id": "5aac346f0e0a267833004d58",
            "department": "Production",
            "job": "Producer"
        },
        {
            "adult": false,
            "gender": 2,
            "id": 9820,
            "known_for_department": "Art",
            "name": "Andy Nicholson",
            "original_name": "Andy Nicholson",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "6115d70499d5c30075dd042d",
            "department": "Art",
            "job": "Production Design"
        },
        {
            "adult": false,
            "gender": 2,
            "id": 9820,
            "known_for_department": "Art",
            "name": "Andy Nicholson",
            "original_name": "Andy Nicholson",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "5da2cf211967570011a9bcc0",
            "department": "Production",
            "job": "Production Designer"
        },
        {
            "adult": false,
            "gender": 2,
            "id": 13179,
            "known_for_department": "Sound",
            "name": "Tony Lamberti",
            "original_name": "Tony Lamberti",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "6115d7ea3dc313005c33eee5",
            "department": "Sound",
            "job": "Sound Designer"
        },
        {
            "adult": false,
            "gender": 2,
            "id": 13179,
            "known_for_department": "Sound",
            "name": "Tony Lamberti",
            "original_name": "Tony Lamberti",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "6115d7e3a097dc002cd053e4",
            "department": "Sound",
            "job": "Sound Re-Recording Mixer"
        },
        {
            "adult": false,
            "gender": 2,
            "id": 42035,
            "known_for_department": "Sound",
            "name": "Sean McCormack",
            "original_name": "Sean McCormack",
            "popularity": 0.66,
            "profile_path": null,
            "credit_id": "61722404abdec00029ace329",
            "department": "Sound",
            "job": "Supervising Sound Editor"
        },
        {
            "adult": false,
            "gender": 2,
            "id": 42036,
            "known_for_department": "Sound",
            "name": "Kami Asgar",
            "original_name": "Kami Asgar",
            "popularity": 1.4,
            "profile_path": null,
            "credit_id": "6115d7bf3dc313002c6be341",
            "department": "Sound",
            "job": "Supervising Sound Editor"
        },
        {
            "adult": false,
            "gender": 2,
            "id": 18264,
            "known_for_department": "Sound",
            "name": "Steve Jablonsky",
            "original_name": "Steve Jablonsky",
            "popularity": 0.84,
            "profile_path": "/aJntUZkZzlHRszlxzSaztAN9N7O.jpg",
            "credit_id": "6115d6ee0f0da50080b18303",
            "department": "Sound",
            "job": "Original Music Composer"
        },
        {
            "adult": false,
            "gender": 2,
            "id": 18918,
            "known_for_department": "Acting",
            "name": "Dwayne Johnson",
            "original_name": "Dwayne Johnson",
            "popularity": 41.871,
            "profile_path": "/kuqFzlYMc2IrsOyPznMd1FroeGq.jpg",
            "credit_id": "5aac347dc3a36846ea004d2f",
            "department": "Production",
            "job": "Producer"
        },
        {
            "adult": false,
            "gender": 2,
            "id": 21984,
            "known_for_department": "Art",
            "name": "Larry Dias",
            "original_name": "Larry Dias",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "6115d77c151c5c00732674b7",
            "department": "Art",
            "job": "Set Decoration"
        },
        {
            "adult": false,
            "gender": 2,
            "id": 57633,
            "known_for_department": "Directing",
            "name": "Rawson Marshall Thurber",
            "original_name": "Rawson Marshall Thurber",
            "popularity": 6.032,
            "profile_path": "/4gpzB12oy73qr5nWNNyZICz9nFB.jpg",
            "credit_id": "6115d874006b010046a04bf2",
            "department": "Writing",
            "job": "Screenplay"
        },
        {
            "adult": false,
            "gender": 2,
            "id": 57633,
            "known_for_department": "Directing",
            "name": "Rawson Marshall Thurber",
            "original_name": "Rawson Marshall Thurber",
            "popularity": 6.032,
            "profile_path": "/4gpzB12oy73qr5nWNNyZICz9nFB.jpg",
            "credit_id": "5aac342192514116b10047e9",
            "department": "Directing",
            "job": "Director"
        },
        {
            "adult": false,
            "gender": 2,
            "id": 57633,
            "known_for_department": "Directing",
            "name": "Rawson Marshall Thurber",
            "original_name": "Rawson Marshall Thurber",
            "popularity": 6.032,
            "profile_path": "/4gpzB12oy73qr5nWNNyZICz9nFB.jpg",
            "credit_id": "5ada8acf9251410ad50015a7",
            "department": "Production",
            "job": "Producer"
        },
        {
            "adult": false,
            "gender": 1,
            "id": 75391,
            "known_for_department": "Art",
            "name": "Danielle Berman",
            "original_name": "Danielle Berman",
            "popularity": 0.706,
            "profile_path": null,
            "credit_id": "6115d76c957e6d0044329e89",
            "department": "Art",
            "job": "Set Decoration"
        },
        {
            "adult": false,
            "gender": 2,
            "id": 111456,
            "known_for_department": "Editing",
            "name": "Michael L. Sale",
            "original_name": "Michael L. Sale",
            "popularity": 0.84,
            "profile_path": null,
            "credit_id": "5b6eaf0cc3a36818971504c0",
            "department": "Editing",
            "job": "Editor"
        },
        {
            "adult": false,
            "gender": 2,
            "id": 574092,
            "known_for_department": "Directing",
            "name": "James Bitonti",
            "original_name": "James Bitonti",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "5b1f1029c3a36808ac01165d",
            "department": "Directing",
            "job": "First Assistant Director"
        },
        {
            "adult": false,
            "gender": 2,
            "id": 962164,
            "known_for_department": "Art",
            "name": "Jason Knox-Johnston",
            "original_name": "Jason Knox-Johnston",
            "popularity": 0.694,
            "profile_path": null,
            "credit_id": "5d80fce0d5dbc2001bed55b6",
            "department": "Art",
            "job": "Supervising Art Director"
        },
        {
            "adult": false,
            "gender": 1,
            "id": 1039217,
            "known_for_department": "Production",
            "name": "Dany Garcia",
            "original_name": "Dany Garcia",
            "popularity": 6.824,
            "profile_path": "/nZnQuskqDYmm9BDfsgRjDyVakCR.jpg",
            "credit_id": "5aac348e0e0a267833004d7e",
            "department": "Production",
            "job": "Producer"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1275131,
            "known_for_department": "Camera",
            "name": "Markus Förderer",
            "original_name": "Markus Förderer",
            "popularity": 0.6,
            "profile_path": "/c10BcOo5hGiTpTW8PbzkQ6ZLEy2.jpg",
            "credit_id": "603840258b959e006a99062d",
            "department": "Camera",
            "job": "Director of Photography"
        },
        {
            "adult": false,
            "gender": 2,
            "id": 1340132,
            "known_for_department": "Visual Effects",
            "name": "Blondel Aidoo",
            "original_name": "Blondel Aidoo",
            "popularity": 0.624,
            "profile_path": null,
            "credit_id": "617224410d5d8500915cbb8a",
            "department": "Visual Effects",
            "job": "Visual Effects Producer"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1373700,
            "known_for_department": "Art",
            "name": "Will Coubrough",
            "original_name": "Will Coubrough",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "6115d73399d5c3005e7f4389",
            "department": "Art",
            "job": "Art Direction"
        },
        {
            "adult": false,
            "gender": 2,
            "id": 1378171,
            "known_for_department": "Sound",
            "name": "Kevin O’Connell",
            "original_name": "Kevin O’Connell",
            "popularity": 0.786,
            "profile_path": null,
            "credit_id": "61722414156cc7008630de89",
            "department": "Sound",
            "job": "Sound Re-Recording Mixer"
        },
        {
            "adult": false,
            "gender": 2,
            "id": 1393382,
            "known_for_department": "Sound",
            "name": "David Werntz",
            "original_name": "David Werntz",
            "popularity": 0.766,
            "profile_path": null,
            "credit_id": "6115d7aaf1759c0044365ea5",
            "department": "Sound",
            "job": "Sound Designer"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1400555,
            "known_for_department": "Art",
            "name": "George Lee",
            "original_name": "George Lee",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "617223980d5d85002ae7db33",
            "department": "Art",
            "job": "Set Designer"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1412998,
            "known_for_department": "Costume & Make-Up",
            "name": "Ginger Knussmann",
            "original_name": "Ginger Knussmann",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "617225158ddc340044b1293e",
            "department": "Costume & Make-Up",
            "job": "Set Costumer"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1413000,
            "known_for_department": "Costume & Make-Up",
            "name": "Richard Schoen",
            "original_name": "Richard Schoen",
            "popularity": 0.694,
            "profile_path": null,
            "credit_id": "617224a2176a940085377e8c",
            "department": "Costume & Make-Up",
            "job": "Costume Supervisor"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1415020,
            "known_for_department": "Costume & Make-Up",
            "name": "Kate Duke",
            "original_name": "Kate Duke",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "617224e80d5d8500915cbd4b",
            "department": "Costume & Make-Up",
            "job": "Set Costumer"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1442119,
            "known_for_department": "Art",
            "name": "Justin O'Neal Miller",
            "original_name": "Justin O'Neal Miller",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "6115d753a097dc0044b99d21",
            "department": "Art",
            "job": "Art Direction"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1463272,
            "known_for_department": "Costume & Make-Up",
            "name": "Jennifer Hodges",
            "original_name": "Jennifer Hodges",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "617222af7e348300634df305",
            "department": "Costume & Make-Up",
            "job": "Key Hair Stylist"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1466097,
            "known_for_department": "Production",
            "name": "Hiram Garcia",
            "original_name": "Hiram Garcia",
            "popularity": 0.698,
            "profile_path": null,
            "credit_id": "5aac349c92514116c0004aaf",
            "department": "Production",
            "job": "Producer"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1500412,
            "known_for_department": "Production",
            "name": "Wendy Jacobson",
            "original_name": "Wendy Jacobson",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "5aac34b1c3a36846bd0046ce",
            "department": "Production",
            "job": "Executive Producer"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1510431,
            "known_for_department": "Costume & Make-Up",
            "name": "Stefano De Nardis",
            "original_name": "Stefano De Nardis",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "617224f4d18b24006385322c",
            "department": "Costume & Make-Up",
            "job": "Costume Supervisor"
        },
        {
            "adult": false,
            "gender": 1,
            "id": 1520695,
            "known_for_department": "Art",
            "name": "Andi Crumbley",
            "original_name": "Andi Crumbley",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "6115d74287f3f200755e0949",
            "department": "Art",
            "job": "Art Direction"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1521454,
            "known_for_department": "Costume & Make-Up",
            "name": "Nancy Cummings",
            "original_name": "Nancy Cummings",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "617222a38ddc34006241eade",
            "department": "Costume & Make-Up",
            "job": "Makeup Artist"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1536209,
            "known_for_department": "Visual Effects",
            "name": "Mathieu Raynault",
            "original_name": "Mathieu Raynault",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "617a26475294e7002a46ef2f",
            "department": "Visual Effects",
            "job": "Visual Effects Supervisor"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1543203,
            "known_for_department": "Art",
            "name": "Rachel Block",
            "original_name": "Rachel Block",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "6115d71c151c5c007326735c",
            "department": "Art",
            "job": "Art Direction"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1548474,
            "known_for_department": "Visual Effects",
            "name": "Rebecca West",
            "original_name": "Rebecca West",
            "popularity": 0.67,
            "profile_path": null,
            "credit_id": "61722486d18b240063852ff3",
            "department": "Visual Effects",
            "job": "Visual Effects Producer"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1556970,
            "known_for_department": "Art",
            "name": "Rory Bruen",
            "original_name": "Rory Bruen",
            "popularity": 0.679,
            "profile_path": null,
            "credit_id": "6115d727151c5c00732673ac",
            "department": "Art",
            "job": "Supervising Art Director"
        },
        {
            "adult": false,
            "gender": 2,
            "id": 1570986,
            "known_for_department": "Acting",
            "name": "Chris Hahn",
            "original_name": "Chris Hahn",
            "popularity": 0.677,
            "profile_path": "/yk1PyDpecsqybv9mepCYylKks0k.jpg",
            "credit_id": "619346a4498bc200938c35f4",
            "department": "Crew",
            "job": "Stunts"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1573037,
            "known_for_department": "Costume & Make-Up",
            "name": "Suzanna Boykin",
            "original_name": "Suzanna Boykin",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "617222848ddc34002d42e65e",
            "department": "Costume & Make-Up",
            "job": "Hairstylist"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1576849,
            "known_for_department": "Sound",
            "name": "Dan Kenyon",
            "original_name": "Dan Kenyon",
            "popularity": 0.84,
            "profile_path": null,
            "credit_id": "6115d7ccb686b900452bdc90",
            "department": "Sound",
            "job": "Sound Effects Editor"
        },
        {
            "adult": false,
            "gender": 1,
            "id": 1605599,
            "known_for_department": "Visual Effects",
            "name": "Virginie Wintrebert",
            "original_name": "Virginie Wintrebert",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "617a2669e323f30045b734b3",
            "department": "Visual Effects",
            "job": "Visual Effects Producer"
        },
        {
            "adult": false,
            "gender": 2,
            "id": 1650813,
            "known_for_department": "Art",
            "name": "Adam Squires",
            "original_name": "Adam Squires",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "6115d75cb686b9005dbf7dcb",
            "department": "Art",
            "job": "Art Direction"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1713057,
            "known_for_department": "Crew",
            "name": "Hubert Maston",
            "original_name": "Hubert Maston",
            "popularity": 0.84,
            "profile_path": null,
            "credit_id": "617a261ed388ae008aff3369",
            "department": "Visual Effects",
            "job": "Visual Effects Supervisor"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1725772,
            "known_for_department": "Visual Effects",
            "name": "Tony Lupoi",
            "original_name": "Tony Lupoi",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "617224690d5d850065e569f3",
            "department": "Visual Effects",
            "job": "Visual Effects Supervisor"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1740529,
            "known_for_department": "Crew",
            "name": "Sean Pollack",
            "original_name": "Sean Pollack",
            "popularity": 0.694,
            "profile_path": null,
            "credit_id": "617a2637c14fee008cc4221a",
            "department": "Visual Effects",
            "job": "Visual Effects Supervisor"
        },
        {
            "adult": false,
            "gender": 2,
            "id": 1779512,
            "known_for_department": "Acting",
            "name": "Jackson Spidell",
            "original_name": "Jackson Spidell",
            "popularity": 1.564,
            "profile_path": "/7cozKHcmO4MOOViAMqE4FXd0Bmf.jpg",
            "credit_id": "5e8a9a76ffd44d00131a22d3",
            "department": "Crew",
            "job": "Fight Choreographer"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1856158,
            "known_for_department": "Art",
            "name": "Sam Carter",
            "original_name": "Sam Carter",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "617223235c5cc80042099514",
            "department": "Art",
            "job": "Set Dresser"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1856161,
            "known_for_department": "Art",
            "name": "Terry Hill",
            "original_name": "Terry Hill",
            "popularity": 0.694,
            "profile_path": null,
            "credit_id": "617223625c5cc80065bc65e2",
            "department": "Art",
            "job": "Set Dresser"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1894754,
            "known_for_department": "Costume & Make-Up",
            "name": "Stephanie Powers",
            "original_name": "Stephanie Powers",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "617a26c5eee186002c0ee18a",
            "department": "Costume & Make-Up",
            "job": "Set Costumer"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1908585,
            "known_for_department": "Costume & Make-Up",
            "name": "Cassie Russek",
            "original_name": "Cassie Russek",
            "popularity": 0.755,
            "profile_path": null,
            "credit_id": "617222eb156cc700421e979c",
            "department": "Costume & Make-Up",
            "job": "Key Hair Stylist"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1918484,
            "known_for_department": "Visual Effects",
            "name": "Jacinthe Côté",
            "original_name": "Jacinthe Côté",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "617a25f6678259008fd62e39",
            "department": "Visual Effects",
            "job": "Visual Effects Producer"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 2007587,
            "known_for_department": "Costume & Make-Up",
            "name": "Leay Cangelosi",
            "original_name": "Leay Cangelosi",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "6172228d894ed600646bae2d",
            "department": "Costume & Make-Up",
            "job": "Hairstylist"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 2007614,
            "known_for_department": "Art",
            "name": "Maxfield Ladish",
            "original_name": "Maxfield Ladish",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "6172238dac4161006291d0fc",
            "department": "Art",
            "job": "Set Dresser"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 2026870,
            "known_for_department": "Production",
            "name": "Scott Sheldon",
            "original_name": "Scott Sheldon",
            "popularity": 0.828,
            "profile_path": null,
            "credit_id": "617a270ff8595800435547a1",
            "department": "Production",
            "job": "Executive Producer"
        },
        {
            "adult": false,
            "gender": 1,
            "id": 2028806,
            "known_for_department": "Art",
            "name": "Kristen Jenkins",
            "original_name": "Kristen Jenkins",
            "popularity": 0.694,
            "profile_path": null,
            "credit_id": "6172237f176a940042b7bae1",
            "department": "Art",
            "job": "Set Designer"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 2031435,
            "known_for_department": "Costume & Make-Up",
            "name": "Jacqueline Noel",
            "original_name": "Jacqueline Noel",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "617222ca0d5d850043737077",
            "department": "Costume & Make-Up",
            "job": "Hairstylist"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 2060941,
            "known_for_department": "Art",
            "name": "Eitan Sonnenberg",
            "original_name": "Eitan Sonnenberg",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "617223c16d4c9700653b6082",
            "department": "Art",
            "job": "Set Dresser"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 2137390,
            "known_for_department": "Art",
            "name": "Britain Illingworth-Cramer",
            "original_name": "Britain Illingworth-Cramer",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "61722373bf09d1004462009b",
            "department": "Art",
            "job": "Set Designer"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 2781964,
            "known_for_department": "Art",
            "name": "Eric Sherlin",
            "original_name": "Eric Sherlin",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "617223b5c8f85800677741b3",
            "department": "Art",
            "job": "Set Dresser"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 2873565,
            "known_for_department": "Costume & Make-Up",
            "name": "Mark James Ross",
            "original_name": "Mark James Ross",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "617222dfdf86a8006674325b",
            "department": "Costume & Make-Up",
            "job": "Makeup Artist"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 2889535,
            "known_for_department": "Costume & Make-Up",
            "name": "Morgon Lindskog",
            "original_name": "Morgon Lindskog",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "617222be5294e7002a363b9f",
            "department": "Costume & Make-Up",
            "job": "Makeup Artist"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 2969737,
            "known_for_department": "Art",
            "name": "Ashley Fidalgo Fogleman",
            "original_name": "Ashley Fidalgo Fogleman",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "6172233f5c5cc8004209954b",
            "department": "Art",
            "job": "Set Designer"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 2973669,
            "known_for_department": "Costume & Make-Up",
            "name": "Matt Sprunger",
            "original_name": "Matt Sprunger",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "617222f8156cc7008630daeb",
            "department": "Costume & Make-Up",
            "job": "Makeup Artist"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 3129120,
            "known_for_department": "Art",
            "name": "Chris McGlamery",
            "original_name": "Chris McGlamery",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "617223a4cadb6b0062d32c45",
            "department": "Art",
            "job": "Set Dresser"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 3162820,
            "known_for_department": "Costume & Make-Up",
            "name": "Heather Benson",
            "original_name": "Heather Benson",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "6172227a156cc7005e76276c",
            "department": "Costume & Make-Up",
            "job": "Makeup Artist"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 3165994,
            "known_for_department": "Costume & Make-Up",
            "name": "Jessica Craig",
            "original_name": "Jessica Craig",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "61722298df86a800436bbc77",
            "department": "Costume & Make-Up",
            "job": "Makeup Artist"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 3279951,
            "known_for_department": "Costume & Make-Up",
            "name": "Haile Werntz",
            "original_name": "Haile Werntz",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "61722302bf09d1002d805929",
            "department": "Costume & Make-Up",
            "job": "Makeup Artist"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 3287415,
            "known_for_department": "Costume & Make-Up",
            "name": "Tiuana Bell",
            "original_name": "Tiuana Bell",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "617a26845294e7002a46f020",
            "department": "Costume & Make-Up",
            "job": "Costumer"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 3287416,
            "known_for_department": "Costume & Make-Up",
            "name": "Whit Cornwall",
            "original_name": "Whit Cornwall",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "617a2690d236e60043384cf2",
            "department": "Costume & Make-Up",
            "job": "Costumer"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 3287417,
            "known_for_department": "Costume & Make-Up",
            "name": "Enrica Iacoboni",
            "original_name": "Enrica Iacoboni",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "617a26afbb070d006200ebc9",
            "department": "Costume & Make-Up",
            "job": "Set Costumer"
        }
    ]
}
end
