require 'rails_helper'

RSpec.describe 'movie show page' do
  it "has a has a link to take you to the Discover Page", :vcr do

      user = User.create!(name: "Stephanie", email: "steph127@hotmail.com")
      movie = Movie.new(movie_data)

      visit "/users/#{user.id}/movies/#{movie.id}"

      click_on('Discover Page')

      expect(current_path).to eq("/users/#{user.id}/movies")
  end
end
