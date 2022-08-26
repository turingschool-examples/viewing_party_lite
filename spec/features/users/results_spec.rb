require 'rails_helper' 

RSpec.describe 'ResultsPage' do 
  @users = let!(:users) { create_list(:user, 3) }

  it 'shows the Top Movies', :vcr do 
    user1 = users[0]

    visit "users/#{user1.id}/movies?q=top%20rated"

    expect(page).to have_content('Vote Average:', count:20)

    expect(page).to have_content 'The Shawshank Redemption'
    expect(page).to have_content 'Vote Average: 8.7'

    expect(page).to have_content 'Dilwale Dulhania Le Jayenge'
    expect(page).to have_content 'Vote Average: 8.7'

    expect(page).to have_content "The Godfather"
    expect(page).to have_content 'Vote Average: 8.7'

    expect(page).to have_content "Schindler's List"
    expect(page).to have_content 'Vote Average: 8.6'
  end

  it 'has links to Movie show pages', :vcr do 
    user1 = users[0]

    visit "users/#{user1.id}/movies?q=top%20rated"

    # movie = MovieFacade.get_top_rated[0]
    # binding.pry 
    click_link "The Godfather" 
    expect(current_path).to eq "/users/#{user1.id}/movies/238"
  end 

  it 'has a button to return to the Discover Page', :vcr do 
    user1 = users[0]

    visit "users/#{user1.id}/movies?q=top%20rated"

    click_button 'Discover Movies' 
    expect(current_path).to eq "/users/#{user1.id}/discover"
  end

  it 'shows the Movies matching the search key term', :vcr do 
    user1 = users[0]

    visit "/users/#{user1.id}/discover"
    fill_in 'Title Key Words', with: 'days of summer' 
    click_button 'Search by Movie Title'

    expect(page).to have_content '(500) Days of Summer'
    expect(page).to have_content 'Vote Average: 7.3'

    expect(page).to have_content 'Dog Days of Summer'
    expect(page).to have_content 'Vote Average: 5.1'

    expect(page).to have_content 'The Long Days of Summer'
    expect(page).to have_content 'Vote Average: 0'

    expect(page).to have_content 'Last Days of Summer'
    expect(page).to have_content 'Vote Average: 0'

    expect(page).to have_content 'Days of the Bagnold Summer'
    expect(page).to have_content 'Vote Average: 6'
  end
end