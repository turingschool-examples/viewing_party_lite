require 'rails_helper'

RSpec.describe 'Discover Movies Page' do
  it 'the discover page has a button to discover the top rated movies', :vcr do
    user1 = User.create!(name: 'Amanda', email: 'amanda@turing.edu')
    
    visit "/users/#{user1.id}/discover"
    save_and_open_page
    click_button 'Discover The Top Rated Movies'
    expect(current_path).to eq("/users/#{user1.id}/movies")
  end
  
  it 'has a search field to enter movie title keywords', :vcr do
    user1 = User.create!(name: 'Amanda', email: 'amanda@turing.edu')
    visit "/users/#{user1.id}/discover"
    expect(page).to have_field("q")
    fill_in(:q, with: "Shawshank")
    click_button "Find Movies"
    expect(current_path).to eq("/users/#{user1.id}/movies")
    
  end
  it 'takes you to the top rated movies', :vcr do 
    user1 = User.create!(name: 'Amanda', email: 'amanda@turing.edu')
    
    visit "/users/#{user1.id}/discover"
    click_button 'Discover The Top Rated Movies'
    expect(current_path).to eq("/users/#{user1.id}/movies")
    expect(page).to have_content('The Godfather Vote Average:8.7')
    expect(page).to have_content('दिलवाले दुल्हनिया ले जायेंगे Vote Average:8.6')
    expect(page).to have_content('同級生 Vote Average:8.5')
  end

  it 'takes you to the movie from title keywords search', :vcr do
    user1 = User.create!(name: 'Amanda', email: 'amanda@turing.edu')
    visit "/users/#{user1.id}/discover"
    expect(page).to have_field("q")
    fill_in(:q, with: "Princess space")
    click_button "Find Movies"
    expect(current_path).to eq("/users/#{user1.id}/movies")
    expect(page).to have_content('Space Princess')
    expect(page).to have_content("형님 아내4 - 우주공주 춘향")
    
    save_and_open_page
  end

end