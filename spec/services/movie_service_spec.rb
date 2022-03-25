require 'rails_helper'

RSpec.describe MovieService do
  describe 'class methods' do
    it 'returns top rated movies' do
      movies = MovieService.top_rated

      expect(movies).to be_an(Array)
      expect(movies[0][:title]).to eq('The Shawshank Redemption')
    end

    xit 'searches for a movie given a keyword' do
      search = MovieService.search_for_movie("shawshank")
      expect(search).to be('The Shawshank Redemption')
    end

    it 'creates cast member poros' do
      cast_members = MovieService.cast_members(278)

      expect(cast_members).to be_an(Hash)
    end

    it "can get review info" do
      review_search = MovieService.get_review(278)

      expect(review_search).to be_a(Array)
    end
  end
end
