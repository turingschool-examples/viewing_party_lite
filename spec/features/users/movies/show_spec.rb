require 'rails_helper'

RSpec.describe 'movie details page' do

  it "has a button to create a new viewing party" do
    user1 = User.create!(name: 'Jane Powell', email: 'jpowell38@gmail.com')
    attributes = {
      title: 'Titanic',
      id: 1,
      vote_average: 9.1,
      runtime: 194
    }
    movie = Movie.new(attributes)
    visit "/users/#{user1.id}/movies/#{movie.id}"
save_and_open_page
    expect(page).to have_button("Create a Viewing Party")
    click_button("Create a Viewing Party")
    expect(current_path).to eq("/users/#{user1.id}/movies/#{movie.id}/viewing_party/new")
  end 
end