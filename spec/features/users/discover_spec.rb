require 'rails_helper' 

RSpec.describe 'DiscoverMoviesPage', type: :feature do 
  @users = let!(:users) { create_list(:user, 3) }

  it 'has a button to Discover Top Rated Movies and a search bar' do 
    user1 = users[0]
    
    visit "/users/#{user1.id}/discover"

    expect(page).to have_button 'Discover Top Rated Movies' 

    expect(page).to have_content 'Search for Movie by Title'
    expect(page).to have_field 'Title Key Words'
    expect(page).to have_button 'Search by Movie Title'
  end

  it 'visits the Movies Results Page when user clicks on Top Rated Movies button' do 
    user1 = users[0]
    
    visit "/users/#{user1.id}/discover"

    click_button 'Discover Top Rated Movies'

    expect(current_path).to eq "/users/#{user1.id}/movies" 
  end

  it 'visits the Movies Results Page when user searches for a movie' do 
    user1 = users[0]
    
    visit "/users/#{user1.id}/discover"

    fill_in 'Title Key Words', with: 'god father' 
    click_button 'Search by Movie Title'

    expect(current_path).to eq "/users/#{user1.id}/movies" 
  end
end

# expect(page).to have_button 'Return to Discover Page'
# click_button 'Return to Discover Page' 
# expect(current_path).to eq "/users/#{user1.id}/discover"