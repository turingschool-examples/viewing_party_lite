require 'rails_helper'

 RSpec.describe 'movie results page' do
   it 'has a title link and a vote average of the movie' do
     VCR.use_cassette('popular_movies', re_record_interval: 30.days) do
     user = User.create!(name: "Stephanie", email: "steph127@hotmail.com")
     movie = Movie.new(original_title: "Red Notice", vote_average: 6.8, id: 512195)

     visit "/users/#{user.id}/movies"

     expect(page).to have_content(movie.vote_average)
     click_on(movie.original_title)

     expect(current_path).to eq("/users/#{user.id}/movies/#{movie.id}")
    end
   end
 end
