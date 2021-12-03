require 'rails_helper'

RSpec.describe 'movie show page' do
  it "has a has a link to take you to the Discover Page" do
      VCR.use_cassette('popular_movies', re_record_interval: 30.days) do
      user = User.create!(name: "Stephanie", email: "steph127@hotmail.com")
      movie = Movie.new(original_title: "Red Notice", vote_average: 6.8, id: 512195)

      visit "/users/#{user.id}/movies/#{movie.id}"

      click_on('Discover Page')

      expect(current_path).to eq("/users/#{user.id}/movies")
    end
  end
end
