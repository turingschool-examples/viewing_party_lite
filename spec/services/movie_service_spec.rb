require 'rails_helper'

RSpec.describe MovieService do
  describe 'class methods' do
    it 'returns top rated movies' do
      movies = MovieService.top_rated

      expect(movies).to be_an(Array)
      expect(movies[0][:title]).to eq('The Shawshank Redemption')
    end

    it 'searches for a movie given a keyword' do
      search = MovieService.search_for_movie("shawshank")
      expect(search).to be_a(Hash)
      expect(search[:title]).to eq("The Shawshank Redemption")
    end

    it 'looks for cast members' do
      cast_members = MovieService.cast_members(278)

      expect(cast_members).to be_an(Array)
    end

    it "can get review info" do
      review_search = MovieService.get_review(278)

      expect(review_search).to be_a(Array)
    end
  end
end
