require 'rails_helper'
# When I visit a movie's detail page (/users/:user_id/movies/:movie_id where :id is a valid user id,
# I should see
#
#  Button to create a viewing party
#  Button to return to the Discover Page
# Details This viewing party button should take the user to the new viewing party page (/users/:user_id/movies/:movie_id/viewing-party/new)
#
# And I should see the following information about the movie:
#
#  Movie Title
#  Vote Average of the movie
#  Runtime in hours & minutes
#  Genre(s) associated to movie
#  Summary description
#  List the first 10 cast members (characters&actress/actors)
#  Count of total reviews
#  Each review's author and information

RSpec.describe 'movie details page', :vcr do

  it 'has link to create viewing party' do
    user1 = User.create!(email: "user1@example.com", name: "Jeff Casimir", password: 'test123', password_confirmation: 'test123')

    visit "/users/#{user1.id}/movies/278"

    expect(page).to have_link("Discover")

    click_link 'Create Viewing Party'

    save_and_open_page

    expect(current_path).to eq("/users/#{user1.id}/movies/278/viewing-party/new")

    expect(page).to have_content("The Shawshank Redemption")
    expect(page).to have_content("Vote Average: 8.7")
    expect(page).to have_content("Genre(s): Drama, Crime")
    expect(page).to have_content("Summary: Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.")
  end
end
