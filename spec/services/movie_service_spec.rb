require 'rails_helper'

RSpec.describe MovieService do
  describe '::get_search_movie' do
    it 'makes a service call and returns data for one movie' do
      movie = MovieService.get_search_movie("The Art of 'Spirited Away'")

      expect(movie[0][:title]).to eq("The Art of 'Spirited Away'")
    end
  end
end
