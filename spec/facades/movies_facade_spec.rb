require 'rails_helper'

RSpec.describe MoviesFacade do
  it 'returns collections of top rated movies' do
    VCR.use_cassette('top_rated_movies') do
    result = MoviesFacade.top_rated

    expect(result).to be_an(Array)
    expect(result.first).to be_a(Movie)   
    end
  end

  it 'returns a collection of movies containing a given keyword' do
    keyword = "Minions"

    VCR.use_cassette("search_#{keyword}") do
      response = MoviesFacade.search(keyword)

      expect(response).to be_an(Array)
      expect(response.first).to be_a(Movie)
      expect(response.count).to be <= 40
      expect(response.sample.title).to include(keyword)
    end
  end

  it 'can search multiple keywords' do
    keyword = "Lord Rings"

    VCR.use_cassette("search_#{keyword}") do
      response = MoviesFacade.search(keyword)

      expect(response).to be_an(Array)
      expect(response.first).to be_a(Movie)
      expect(response.count).to be <= 40
      keyword.split.each do |word|
        expect(response.sample.title).to include(word)
      end
    end
  end
end