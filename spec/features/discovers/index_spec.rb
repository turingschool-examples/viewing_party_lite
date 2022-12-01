require 'rails_helper'

RSpec.describe 'Discover Movies Index Page' do 
  before :each do 
    @user1 = User.create!(name: 'Kevin', email: 'Kta@turing.edu')
    @user2 = User.create!(name: 'Bryan', email: 'Bkeen@turing.edu')

    visit user_discovers_path(@user1)
  end

  xit 'should have a button to find top rated movies' do 
    
    expect(page).to have_content('Discover Movies')
    expect(page).to have_button('Find Top Rated Movies')

    click_button('Find Top Rated Movies') #This will/ should return only 20 by default

    expect(current_path).to eq("/users/#{@user1.id}/movies")
    expect(page).to have_content("The Godfather")               #two examples out of the two top results
    expect(page).to have_content("The Shawshank Redemption")
    expect(page).to_not have_content("Suicide Squad")
  end

  xit 'has a search bar with submit button to find movies' do 

  expect(page).to have_button('Find Movies')

  fill_in('keyword', with: 'Suicide Squad')
  click_button('Find Movies')
  expect(page).to have_content("Suicide Squad")
  expect(page).to have_content("Vote Average: 5.91")
  expect(page).to_not have_content("Superman")
  end
end