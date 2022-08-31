require 'rails_helper'

RSpec.describe 'movie show', type: :feature do
  let!(:user1) { FactoryBot.create(:user) }
  
  xit 'has button to create viewing party', :vcr do
    visit "/users/#{user1.id}/discover"

    fill_in 'search', with: 'Finding Nemo'
    click_on 'Search'

    click_on "Finding Nemo"
 end
    
  it 'shows movie information', :vcr do
    fill_in 'search', with: 'Finding Nemo'
    click_on 'Search'

    click_on "Finding Nemo"
    visit "/users/#{user1.id}/movies/#{response}"
  end
end
