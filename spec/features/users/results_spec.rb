require 'rails_helper' 

RSpec.describe 'ResultsPage' do 
  @users = let!(:users) { create_list(:user, 3) }

  it 'shows the Top Movies', :vcr do 
    user1 = users[0]

    visit "users/#{user1.id}/movies?q=top%20rated"

    expect(page).to have_content 'Top Rated Movies'
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
end

# "/users/<%= @user.id %>/movies/#{movie.id}"