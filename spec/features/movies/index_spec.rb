require 'rails_helper'

RSpec.describe '' do 
    describe 'happy path' do 
        it 'allows user to search for movies' do 
            json_response = File.read('./spec/fixtures/top_rated.json')
            stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV["api_key"]}").
            to_return(status: 200, body: json_response)

            user_1 = User.create!(name: "Bryan", email: "bryan@bryan.com")

            visit "users/#{user_1.id}/discover"

            fill_in :movie_title, with: "The Shawshank Redemption"
            click_button 'Search'

            expect(page.status_code).to eq(200)
            expect(page).to have_content("The Shawshank Redemption")
        end 
    end 
end 