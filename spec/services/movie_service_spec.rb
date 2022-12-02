require 'rails_helper'

RSpec.describe MovieService, :vcr do 
  context "class methods" do 
    context "#movie_details(movie_id)" do 
      it 'returns a movies details' do
        movie_data = MovieService.movie_details(550)
        expect(movie_data).to be_a Hash
        expect(movie_data[:title]).to be_a String
        expect(movie_data[:poster_path]).to be_a String
      end
    end

    context '#movie_credits(movie_id)' do
      it 'returns a movies credits' do
        credit_data = MovieService.movie_credits(550)
        expect(credit_data). to be_a Hash
        expect(credit_data[:cast][0][:name]).to eq("Edward Norton")
        expect(credit_data[:cast][0][:character]).to eq("The Narrator")
      end
    end
  end
end