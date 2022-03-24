require 'rails_helper'
# When I visit the new viewing party page (/users/:user_id/movies/:movid_id/viewing-party/new, where :user_id is a valid user's id),
# I should see the name of the movie title rendered above a form with the following fields:
#
#  Duration of Party with a default value of movie runtime in minutes; a viewing party should NOT be created if set to a value less than the duration of the movie
#  When: field to select date
#  Start Time: field to select time
#  Checkboxes next to each existing user in the system
#  Button to create a party
# Details When the party is created, the user should be redirected back to the dashboard where the new event is shown. The event should also be listed on any other user's dashbaords that were also invited to the party.

RSpec.describe 'New party page' do
  it 'When i visit the new party page has title and form', :vcr do
    user_1 = User.create!(name: "Becky", email: "becky@example.com")
    user_2 = User.create!(name: "Steven", email: "steven@example.com")
    movie_id = 22
    
    visit new_user_movie_viewing_party_path(user_1, movie_id)
    fill_in :duration, with: '102'
    fill_in :date, with: '3/23/2022'
    fill_in :start_time, with: '6:30'

    expect(page).to have_field('title', placeholder: "Pirates of the Caribbean: The Curse of the Black Pearl")
    expect(page).to have_field('duration', with: 102)
    expect(page).to have_field('date')
    expect(page).to have_button('Create Party')
  end
end
