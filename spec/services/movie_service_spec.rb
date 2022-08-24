require 'rails_helper'

RSpec.describe MovieService do
  describe '#call_for_a_movie' do
    it 'returns a list of top movies, 20 per page', :vcr do
      data_1 = MovieService.call_top_movies(1)
      expect(data_1[:results].count).to eql(20)
      expect(data_1[:results].first).to be_a(Hash)
      expect(data_1[:results].first).to have_key(:title)
      expect(data_1[:results].first[:title]).to eq('The Shawshank Redemption')

    end
  end
end
