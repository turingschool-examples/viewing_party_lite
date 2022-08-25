require 'rails_helper'

RSpec.describe MovieService do
  it 'exists' do
    ms = MovieService.top_rated

    expect(ms).to be_a(Hash)
  end

  xit '#movies_by_keyword' do
    results = MovieService.movies_by_keyword("Fight")

    expect(results).to be_a(Hash)
  end

  describe '#class methods'
    it 'top_rated' do
      ms = MovieService.top_rated

      expect(ms).to be_a(Hash)
      expect(ms[:results]).to be_a(Array)
    end

    xit "movies_by_keyword" do

      results = MovieService.movies_by_keyword("Fight")

      expect(results).to be_a(Hash)
    end

    it 'movie_details' do
      movie_details = MovieService.movie_details(505)

      expect(movie_details).to be_a(Hash)
    end
end