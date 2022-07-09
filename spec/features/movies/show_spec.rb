require 'rails_helper'

RSpec.describe 'movie show page' do
  before(:each) do
    # require "pry"; binding.pry
    @user1 = User.create!(name: 'Ana', email: 'ana@example.com')
    @movie1 = Movie.new(title: 'The Godfather', id: 238, genres:[
        {
            "id": 18,
            "name": "Drama"
        },
        {
            "id": 80,
            "name": "Crime"
        }
    ], runtime: 175, vote_average: 8.7, summary: "In the continuing saga of the Corleone crime family, a young Vito Corleone grows up in Sicily and in 1910s New York. In the 1950s, Michael Corleone attempts to expand the family business into Las Vegas, Hollywood and Cuba.")
  end

  it 'has a button to create a viewing party', :vcr do
    visit user_movie_path(@user1.id, @movie1.id)
    click_button('Create Viewing Party for The Godfather')
    expect(current_path).to eq(new_user_movie_viewing_party_path(@user1.id, @movie1.id))
  end

  it 'has a button to return to Discover page', :vcr do
    visit user_movie_path(@user1.id, @movie1.id)
    expect(page).to have_button('Discover Page')

    click_button('Discover Page')
    expect(current_path).to eq("/users/#{@user1.id}/discover")
  end

  it 'displays the movie title', :vcr do
    visit user_movie_path(@user1.id, @movie1.id)
    expect(page).to have_content('The Godfather')
    expect(page).to_not have_content('The Exorcist')
  end

  it "display's the movie's vote average", :vcr do
    visit user_movie_path(@user1.id, @movie1.id)
    expect(page).to have_content('Vote Average: 8.7')
    expect(page).to_not have_content('Vote Average: 2.5')
  end

  it "displays the movie's runtime", :vcr do
    visit user_movie_path(@user1.id, @movie1.id)
    expect(page).to have_content('Runtime: 2h 55min')
    expect(page).to_not have_content('Runtime: 175min')
  end

  it "displays the movie's summary", :vcr do
    visit user_movie_path(@user1.id, @movie1.id)
    expect(page).to have_content("Summary: Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.")
    expect(page).to_not have_content("Something else.")
  end

  it "displays the movie's genres", :vcr do
    visit user_movie_path(@user1.id, @movie1.id)
    expect(page).to have_content("Drama Crime")
    expect(page).to_not have_content("Romance")
  end
end
