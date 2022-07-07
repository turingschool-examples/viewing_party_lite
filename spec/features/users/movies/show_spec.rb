require 'rails_helper'

RSpec.describe 'movie details page' do

  it "has a button to create a new viewing party" do
    user1 = User.create!(name: 'Jane Powell', email: 'jpowell38@gmail.com')
    attributes = JSON.parse(File.read('./spec/fixtures/movie_details.json'), symbolize_names: true)

    movie = Movie.new(attributes)
    visit "/users/#{user1.id}/movies/#{movie.id}"

    expect(page).to have_button("Create a Viewing Party")
    click_button("Create a Viewing Party")
    expect(current_path).to eq("/users/#{user1.id}/movies/#{movie.id}/viewing_party/new")
  end 

  it 'displays the vote average, runtime, and genres' do
    user1 = User.create!(name: 'Jane Powell', email: 'jpowell38@gmail.com')
    attributes = JSON.parse(File.read('./spec/fixtures/movie_details.json'), symbolize_names: true)

    movie = Movie.new(attributes)
    visit "/users/#{user1.id}/movies/#{movie.id}"
save_and_open_page
    expect(page).to have_content("Vote Average: #{movie.vote_average}")
    expect(page).to have_content("Runtime: #{movie.runtime}")
    expect(page).to have_content("Genre(s): #{movie.genres.map{ |genre| genre[:name]}.join(', ')}")
  end
end