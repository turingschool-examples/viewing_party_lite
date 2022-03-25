require 'rails_helper'

RSpec.describe MovieFacade do
  context 'class methods' do
    context '#top_rated' do
      it 'returns top rated movies', :vcr do
        search = MovieFacade.top_rated
        expect(search.count).to eq(20)
        expect(search.first).to be_instance_of Movie
      end
    end
    context '#movie_title_search(query)' do
      it 'returns movies based on title provided from user', :vcr do
        search = MovieFacade.movie_title_search("Avengers")
        expect(search.first).to be_instance_of Movie
        expect(search.count).to be > 1
        expect(search.first.title).to include("Avengers")
        expect(search.last.title).to include("Avengers")
      end
    end
    context '#movie_id_search(id)' do
      it 'returns a single movie based on id', :vcr do
        search = MovieFacade.movie_id_search(111)
        expect(search).to be_instance_of Movie 
        expect(search.title).to eq("Scarface")
      end
    end
  end
end
