# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie do
  before :each do
    @data = {
      "adult": false,
      "backdrop_path": '/kXfqcdQKsToO0OUXHcrrNCHDBzO.jpg',
      "belongs_to_collection": nil,
      "budget": 25_000_000,
      "genres": [
        {
          "id": 18,
          "name": 'Drama'
        },
        {
          "id": 80,
          "name": 'Crime'
        }
      ],
      "homepage": '',
      "id": 278,
      "imdb_id": 'tt0111161',
      "original_language": 'en',
      "original_title": 'The Shawshank Redemption',
      "overview": 'Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.',
      "popularity": 77.198,
      "poster_path": '/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg',
      "production_companies": [
        {
          "id": 5,
          "logo_path": '/71BqEFAF4V3qjjMPCpLuyJFB9A.png',
          "name": 'Columbia Pictures',
          "origin_country": 'US'
        },
        {
          "id": 97,
          "logo_path": '/7znWcbDd4PcJzJUlJxYqAlPPykp.png',
          "name": 'Castle Rock Entertainment',
          "origin_country": 'US'
        },
        {
          "id": 174,
          "logo_path": '/IuAlhI9eVC9Z8UQWOIDdWRKSEJ.png',
          "name": 'Warner Bros. Pictures',
          "origin_country": 'US'
        }
      ],
      "production_countries": [
        {
          "iso_3166_1": 'US',
          "name": 'United States of America'
        }
      ],
      "release_date": '1994-09-23',
      "revenue": 28_341_469,
      "runtime": 142,
      "spoken_languages": [
        {
          "english_name": 'English',
          "iso_639_1": 'en',
          "name": 'English'
        }
      ],
      "status": 'Released',
      "tagline": 'Fear can hold you prisoner. Hope can set you free.',
      "title": 'The Shawshank Redemption',
      "video": false,
      "vote_average": 8.7,
      "vote_count": 21_756
    }
    @movie = Movie.new(@data)
  end

  it 'exists and has attributes' do
    expect(@movie.title).to eq('The Shawshank Redemption')
    expect(@movie.vote_average).to eq(8.7)
  end

  it 'genres returns a list of genres' do
    expect(@movie.genres).to eq('Drama, Crime')
  end

  it 'runtime_formatted returns the runtime in hours and minutes' do
    expect(@movie.runtime_formatted).to eq('2hr 22 min')
  end
end
