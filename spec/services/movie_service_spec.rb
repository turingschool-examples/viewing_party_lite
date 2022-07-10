require 'rails_helper'

RSpec.describe MovieService do
  describe '::get_search_movie' do
    it 'makes a service call and returns data for one movie' do
      movie = MovieService.get_search_movie("The Art of 'Spirited Away'")

      expect(movie[0][:title]).to eq("The Art of 'Spirited Away'")
    end
  end

  describe '::get_specific_movie' do
    it 'makes a service call and returns data for one movie' do
      movie = MovieService.get_specific_movie(550)
      expect(movie).to include :title, :vote_average, :runtime, :genres, :overview, :vote_count
    end
  end

  describe '::get_cast' do
    it 'makes a service call and returns data for one movie' do
      movie = MovieService.get_cast(550)[:cast]

      expect(movie[0]).to include :name, :character

      expect(movie[0][:name]).to eq("Edward Norton")
      expect(movie[0][:character]).to eq("The Narrator")
    end
  end

  describe '::get_reviews' do
    it 'makes a service call and returns data for one movie' do
      movie = MovieService.get_reviews(550)[:results]

      expect(movie[0]).to include :author, :content

      expect(movie[0][:author]).to eq("Goddard")
    end
  end
end
