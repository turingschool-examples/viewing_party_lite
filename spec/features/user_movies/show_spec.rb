require 'rails_helper'

RSpec.describe 'users movie show page' do
  before(:each) do
    @user = create(:user)
  end

  it "shows movie details" do
    movie = Movie.new(movie_data)
      visit "/users/#{@user.id}/movies/#{movie.id}"
      expect(page).to have_content("Spirited Away")
    end
  end
