# When I visit the new viewing party page (/users/:user_id/movies/:movid_id/viewing-party/new, where :user_id is a valid user's id),
# I should see the name of the movie title rendered above a form with the following fields:
#  •  Duration of Party with a default value of movie runtime in minutes; a viewing party should NOT be created if set to a value less than the duration of the movie
#  •  When: field to select date
#  •  Start Time: field to select time
#  •  Checkboxes next to each existing user in the system
#  •  Button to create a party
# Details When the party is created, the user should be redirected back to the dashboard where the new event is shown. The event should also be listed on any other user's 
# dashbaords that were also invited to the party.

require 'rails_helper'

RSpec.describe 'viewing party new page' do
  before :each do
    @user1 = User.create!(name: "john", email: "john@email.com")
    @user2 = User.create!(name: "brad", email: "brad@email.com")
    @user3 = User.create!(name: "Max", email: "max@email.com")

    json_response1 = File.read('spec/fixtures/fight_club_details.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/550?api_key=5b03ee47af6e087159e9baca0f110161").to_return(status: 200, body: json_response1, headers: {})
    
    json_response2 = File.read('spec/fixtures/fight_club_cast.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/550/credits?api_key=5b03ee47af6e087159e9baca0f110161&language=en-US").to_return(status: 200, body: json_response2, headers: {})
      
    json_response3 = File.read('spec/fixtures/fight_club_reviews.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/550/reviews?api_key=5b03ee47af6e087159e9baca0f110161&language=en-US&page=1").to_return(status: 200, body: json_response3, headers: {})

    visit user_movie_path(@user1, 550)

    click_button "Create Viewing Party"
  end
  
  it 'creates a new viewing party if all fields are valid' do
    fill_in :duration, with: 140
    fill_in :when, with: "02/02/2023"
    fill_in :start_time, with: "7:00"
    check 'brad@email.com'
    click_button "Create Party"

    expect(current_path).to eq(user_dashboard_index_path(@user1))
  end

  it 'does not create a viewing party if the duration is less than the movie runtime' do
    fill_in :duration, with: 138
    fill_in :when, with: "02/02/2023"
    fill_in :start_time, with: "7:00"
    check 'brad@email.com'
    click_button "Create Party"

    expect(current_path).to eq(new_user_movie_viewing_party_path(@user1, 550))
    expect(page).to have_content("Error: Duration must be equal to or greater than the movie runtime")
  end

  it 'does not create a viewing party if any fields are empty' do
    fill_in :duration, with: ""
    fill_in :when, with: "02/02/2023"
    fill_in :start_time, with: "7:00"
    check 'brad@email.com'
    click_button "Create Party"

    expect(current_path).to eq(new_user_movie_viewing_party_path(@user1, 550))
    expect(page).to have_content("Error: All fields must be completed")
  end
end