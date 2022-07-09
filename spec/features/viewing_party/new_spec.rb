# When I visit the new viewing party page (/users/:user_id/movies/:movid_id/viewing-party/new, where :user_id is a valid user's id),
# I should see the name of the movie title rendered above a form with the following fields:
#
#  Duration of Party with a default value of movie runtime in minutes; a viewing party should NOT be created if set to a value less than the duration of the movie
#  When: field to select date
#  Start Time: field to select time
#  Checkboxes next to each existing user in the system
#  Button to create a party
# Details When the party is created, the user should be redirected back to the dashboard where the new event is shown. The event should also be listed on any other user's dashbaords that were also invited to the party.

require 'rails_helper'

RSpec.describe 'Viewing New Party Form' do
  it 'has a form to create a new viewing party' do

    user_1 = User.create!(name: 'Zac Morris', email: 'zac@gmail.com')
    user_2 = User.create!(name: 'Dee Torres', email: 'dee@gmail.com')
    user_3 = User.create!(name: 'Rae Sull', email: 'rae@gmail.com')
    visit new_user_movie_viewing_party_path(user_1.id, 278)

    expect(page).to have_content('The Shawshank Redemption')

    fill_in :duration, with: 192

    fill_in :date, with: "2022/08/01"
    fill_in :time, with: Time.new(2022, 8, 1, 18, 30).strftime("%T")
    check "#{user_2.email}"
    click_button "Create Party"

    expect(current_path).to eq(user_path(user_1.id))
    expect(page).to have_content('The Shawshank Redemption')
  end

  it "lists parties on all invited guests" do
    user_1 = User.create!(name: 'Zac Morris', email: 'zac@gmail.com')
    user_2 = User.create!(name: 'Dee Torres', email: 'dee@gmail.com')
    user_3 = User.create!(name: 'Rae Sull', email: 'rae@gmail.com')
    visit new_user_movie_viewing_party_path(user_1.id, 278)

    expect(page).to have_content('The Shawshank Redemption')
    
    fill_in :duration, with: 192
    
    fill_in :date, with: "2022/08/01"
    fill_in :time, with: Time.new(2022, 8, 1, 18, 30).strftime("%T")
    check "#{user_2.email}"
    click_button "Create Party"
    
    visit user_path(user_2.id)
    expect(page).to have_content('The Shawshank Redemption')
  end
  
  it "does not create a party with duration is less than movie runtime" do
    user_1 = User.create!(name: 'Zac Morris', email: 'zac@gmail.com')
    user_2 = User.create!(name: 'Dee Torres', email: 'dee@gmail.com')
    user_3 = User.create!(name: 'Rae Sull', email: 'rae@gmail.com')
    visit new_user_movie_viewing_party_path(user_1.id, 278)

    expect(page).to have_content('The Shawshank Redemption')
    
    fill_in :duration, with: 102
    
    fill_in :date, with: "2022/08/01"
    fill_in :time, with: Time.new(2022, 8, 1, 18, 30).strftime("%T")
    check "#{user_2.email}"
    click_button "Create Party"
    
    expect(current_path).to eq(new_user_movie_viewing_party_path(user_1.id, 278))
    expect(user_1.parties).to  eq([])
    expect(page).to have_content("Party duration too short, try again.")
  end
end
