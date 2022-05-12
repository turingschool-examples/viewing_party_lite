require 'rails_helper'


RSpec.describe "New User", type: :feature do
  it "has button to create viewing party" do
    user = User.create!(name: "Tim", email: "Tim@mail.com")
    movie = Movie.new(id: 1, title: "Movie", vote_average: "8.2")
    visit "/users/#{user.id}/movies/#{movie.id}"
    click_button "Create new viewing party"

    expect(current_path).to eq("/users/#{user.id}/movies/#{movie.id}/viewing_party/new")
  end

  it 'has a button to return to the discover page' do
    user = User.create!(name: "Tim", email: "Tim@mail.com")
    movie = Movie.new(id: 1, title: "Movie", vote_average: "8.2")
    visit "/users/#{user.id}/movies/#{movie.id}"

    click_on "Return to Discover"
    expect(current_path).to eq("/users/#{user.id}/discover")
  end
end
