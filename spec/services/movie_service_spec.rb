require 'rails_helper'

RSpec.describe MovieService do
  describe '#call_for_a_movie' do
    it 'returns a list of top movies, 20 per page', :vcr do
      data_1 = MovieService.call_top_movies(1)
      expect(data_1[:results].count).to eql(20)
      expect(data_1[:results].first).to be_a(Hash)
      expect(data_1[:results].first).to have_key(:title)
      expect(data_1[:results].first[:title]).to eq('The Shawshank Redemption')

      data_2 = MovieService.call_top_movies(2)
      expect(data_2[:results].count).to eql(20)
      expect(data_2[:results].first).to be_a(Hash)
      expect(data_2[:results].first).to have_key(:title)
      expect(data_2[:results].first[:title]).to eq("Gabriel's Inferno: Part III")
    end
  end

  describe '#call_movie_details' do
    it 'returns a movie details', :vcr do
      data = MovieService.call_movie_details(293660)
      expect(data).to be_a(Hash)
      expect(data).to have_key(:title)
      expect(data[:title]).to eq('Deadpool')
    end
  end

  describe '#call_for_a_movie' do
    it 'returns a list of movies', :vcr do
      data = MovieService.call_for_a_movie('deadpool', 1)
      expect(data).to be_a(Hash)
      expect(data).to have_key(:results)
      expect(data[:results].first).to be_a(Hash)
      expect(data[:results].first).to have_key(:title)
      expect(data[:results].first[:title]).to eq('Deadpool')
    end
  end

  describe '#call_movie_cast' do
    it "returns a list of credits for a movie", :vcr do
      data = MovieService.call_movie_cast(278)
      expect(data).to be_a(Hash)
      expect(data).to have_key(:cast)
      expect(data[:cast].first).to be_a(Hash)
      expect(data[:cast].first).to have_key(:name)
      expect(data[:cast].first).to have_key(:character)
    end
  end

  describe '#call_movie_reviews' do
    it "returns a list of reviews for a movie", :vcr do
      data = MovieService.call_movie_reviews(278)
      expect(data).to be_a(Hash)
      expect(data).to have_key(:total_results)
      expect(data).to have_key(:results)
      expect(data[:results].first).to be_a(Hash)
      expect(data[:results].first).to have_key(:content)
      expect(data[:results].first).to have_key(:author_details)
      expect(data[:results].first[:author_details]).to be_a(Hash)
      expect(data[:results].first[:author_details]).to have_key(:username)

    end
  end
end
