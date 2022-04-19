# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'movie show page' do
  before(:each) do
    @user1 = User.create!(name: 'Becky', email: 'becky@example.com')
    @movie1 = Movie.new(title: 'Scarface', id: 111, runtime: 170, vote_average: 8.2, summary: 'After getting a green card in exchange for assassinating a Cuban government official, Tony Montana stakes a claim on the drug trade in Miami. Viciously murdering anyone who stands in his way, Tony eventually becomes the biggest drug lord in the state, controlling nearly all the cocaine that comes through Miami. But increased pressure from the police, wars with Colombian drug cartels and his own drug-fueled paranoia serve to fuel the flames of his eventual downfall.', poster: '/32pLDObtIt2MJcdPG9mQKuybImL.jpg', genres: [
                          {
                            "id": 28,
                            "name": 'Action'
                          },
                          {
                            "id": 80,
                            "name": 'Crime'
                          },
                          {
                            "id": 18,
                            "name": 'Drama'
                          },
                          {
                            "id": 53,
                            "name": 'Thriller'
                          }
                        ])
  end

  it 'has a button to create a viewing party', :vcr do
    visit user_movie_path(@user1, @movie1.id)
    click_button('Create Viewing Party for Scarface')
  end

  it 'displays the movie title', :vcr do
    visit user_movie_path(@user1, @movie1.id)
    expect(page).to have_content('Scarface')
  end

  it "display's the movie's vote average", :vcr do
    visit user_movie_path(@user1, @movie1.id)
    expect(page).to have_content('Vote Average: 8.2')
  end

  it "displays the movie's runtime", :vcr do
    visit user_movie_path(@user1, @movie1.id)
    expect(page).to have_content('Runtime: 170mins')
  end

  it "displays the movie's summary", :vcr do
    visit user_movie_path(@user1, @movie1.id)
    expect(page).to have_content('After getting a green card in exchange for assassinating a Cuban government official, Tony Montana stakes a claim on the drug trade in Miami. Viciously murdering anyone who stands in his way, Tony eventually becomes the biggest drug lord in the state, controlling nearly all the cocaine that comes through Miami. But increased pressure from the police, wars with Colombian drug cartels and his own drug-fueled paranoia serve to fuel the flames of his eventual downfall.')
  end

  it 'has a button to return to Discover page', :vcr do
    visit user_movie_path(@user1, @movie1.id)
    expect(page).to have_button('Discover Page')

    click_button('Discover Page')

    expect(current_path).to eq(user_discover_index_path(@user1))
  end
end
