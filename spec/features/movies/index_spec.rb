require 'rails_helper'

RSpec.describe 'Movies Page', type: :feature do
  it 'displays top 20 movies as links and their vote average' do
    user = User.create!(name: 'Badger', email: 'honey.new@gmail.com')
    visit user_discover_index_path(user.id)

    click_button 'Top Rated Movies'
    expect(current_path).to eq(user_movies_path(user.id))

    expect(page).to have_content("The Shawshank Redemption")
    expect(page).to have_content("Average Rating: 8.7")
  end

  it 'displays keyword result with link to discover page' do
    user = User.create!(name: 'Badger', email: 'honey.new@gmail.com')
    visit user_discover_index_path(user.id)

    fill_in :q, with: "Rings"
    click_button 'Search'

    expect(current_path).to eq(user_movies_path(user.id))
    expect(page).to have_content('Title', count: 40)
    click_button 'Discover Movies'
    expect(current_path).to eq(user_discover_index_path(user.id))
  end
end


# When I visit the discover movies page,
# and click on either the Top Movies button or the Search button,
# I should be taken to the movies results page (users/:user_id/movies?q=top%20rated, /users/:user_id/movies?q=keyword respectively) where I see:
#
#  Title (As a Link to the Movie Details page)
#  Vote Average of the movie
# Details: There should only be a maximum of 40 results. The above details should be listed for each movie.
#
# I should also see a button to return to the Discover Page.
