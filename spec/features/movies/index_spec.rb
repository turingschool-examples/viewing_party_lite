require 'spec_helper'

RSpec.describe 'movie results page' do
  before(:each) do
    @user = User.create!(name: 'Trevor', email: 'trev@yahoo.com')
    @user2 = User.create!(name: 'Kat', email: 'kat@yahoo.com', search: 'fight')
    @movie = Movie.create!(title: 'Fight Club', vote_average: 5)
    @movie2 = Movie.create!(title: 'Godfather', vote_average: 8)
  end
  #might ping API consider refactoring
  it "has links to movies in search results" do
    visit user_movies_path(@user2)

    expect(page).to have_content('Fight Club')
    expect(page).to_not have_content('Godfather')
    expect(page).to have_content('Vote Average: 5')
    expect(page).to_not have_content('Vote Average: 8')
  end
end
