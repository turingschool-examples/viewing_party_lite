require 'rails_helper'

RSpec.describe 'Create Viewing Party' do 
   let!(:user1) { create(:user) }
  before :each do 
    visit new_user_movie_viewing_party_path(user1, 238)
  end
  
  xit 'has a discover page button' do 
    expect(page).to have_button("Discover Page")
  end

  xit 'has a form to create viewing party for (The Godfather)' do 
    expect(page).to have_content('Viewing Party Details')
    expect(page).to have_content('The Godfather')
    expect(page).to have_button('Create Party')
  end
end