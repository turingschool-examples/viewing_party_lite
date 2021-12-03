require 'rails_helper'

RSpec.describe 'users movie show page' do
  before(:each) do
    @user = create(:user)
    @movie = Movie.new(movie_data)
    cast = Cast.new(cast_data)
    review = Review.new(review_data)
  end

  it "shows movie details" do
    visit "/users/#{@user.id}/movies/#{@movie.id}"
    expect(page).to have_content("Spirited Away")
    expect(page).to have_content("Rumi Hiiragi as Chihiro Ogino / Sen (voice)")
    expect(page).to have_content("1 Reviews")
    expect(page).to have_content("Author: ZeBlah")
    expect(page).to have_content("One of the great")
    expect(page).to have_content("Runtime: 2 hrs 5 min")
  end

  it 'has a button to create a Viewing Party' do
    visit "/users/#{@user.id}/movies/#{@movie.id}"
    expect(page).to have_button("Create Viewing Party for #{@movie.title}")
    click_button("Create Viewing Party for #{@movie.title}")
    expect(current_path).to eq("/users/#{@user.id}/movies/#{@movie.id}/viewing_parties/new")
  end

  it 'has a button to return to the discover page' do
    visit "/users/#{@user.id}/movies/#{@movie.id}"
    expect(page).to have_button("Discover More Movies")
    click_button("Discover More Movies")
    expect(current_path).to eq("/users/#{@user.id}/discover")
  end
end
