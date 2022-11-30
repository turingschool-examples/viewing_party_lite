require 'rails_helper'

RSpec.describe 'Discover Movies Page' do
  it 'the discover page has a button to discover the top rated movies' do
    user1 = User.create!(name: 'Amanda', email: 'amanda@turing.edu')
    
    visit "/users/#{user1.id}/discover"
    click_button 'Discover The Top Rated Movies'
    expect(current_path).to eq("/users/#{user1.id}/movies")
  end
  
  it 'has a search field to enter movie title keywords' do
    user1 = User.create!(name: 'Amanda', email: 'amanda@turing.edu')
    visit "/users/#{user1.id}/discover"
    expect(page).to have_field("q")
    fill_in(:q, with: "Shawshank")
    click_button "Find Movies"
    save_and_open_page
    expect(current_path).to eq("/users/#{user1.id}/movies")
  end

  

end