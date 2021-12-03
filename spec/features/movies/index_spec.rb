require 'rails_helper'

 RSpec.describe 'movie results page' do
   it 'has a title link and a vote average of the movie', :vcr do

     user = User.create!(name: "Stephanie", email: "steph127@hotmail.com")
     movie = Movie.new(movie_data)
     
     visit "/users/#{user.id}/movies"

     expect(page).to have_content(movie.vote_average)
     click_on(movie.original_title)

     expect(current_path).to eq("/users/#{user.id}/movies/#{movie.id}")
  end
end
