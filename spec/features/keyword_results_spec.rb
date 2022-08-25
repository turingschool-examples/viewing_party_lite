require 'rails_helper'
require 'faker'

RSpec.describe 'Keyword Results' do
  it 'allows user to see the movies containing the word(s) searched for', :vcr do
    user1 = User.create!(name: Faker::Name.first_name, email: Faker::Internet.email)

    visit "/users/#{user1.id}/movies?q=Shawshank"

    expect(page.status_code).to eq 200
    expect(page).to have_content("The Shawshank Redemption Vote Average: 8.7")
    expect(page).to have_link("The Shawshank Redemption")
    expect(page).to have_button('Discover Page')
  end
end

# When I visit the discover movies page,
# and click on the Search button,
# I should be taken to the movies results page ( /users/:user_id/movies?q=keyword respectively) where I see:

#  Title (As a Link to the Movie Details page)
#  Vote Average of the movie
# Details: There should only be a maximum of 40 results. The above details should be listed for each movie.

# I should also see a button to return to the Discover Page.