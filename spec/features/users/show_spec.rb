require 'rails_helper'

RSpec.describe 'Show', type: :feature do
  it "shows the user's information, 'Discover Movies button, and parties section" do
    user_1 = User.create(name: 'John Doe', email: 'John@gmail.com')
    user_2 = User.create(name: 'Homer Simpson', email: 'Homer@gmail.com')

    visit "/users/#{user_1.id}"

    expect(page).to have_content("John Doe's Dashboard")
    expect(page).to have_no_content("Homer Simpson's Dashboard")
    expect(page).to have_button('Discover Movies')
    expect(page).to have_content('Viewing Parties')
  end

  it "clicks the 'Discover Movies' button and is taken to that user's 'Discover Movies' page" do
    user_1 = User.create(name: 'John Doe', email: 'John@gmail.com')
    user_2 = User.create(name: 'Homer Simpson', email: 'Homer@gmail.com')

    visit "/users/#{user_1.id}"

    click_button 'Discover Movies'

    expect(current_path).to eq("/users/#{user_1.id}/discover")
  end

  it "searches for a movie and takes you to a results page with that movie's title and vote average", :vcr do
    user_1 = User.create(name: 'John Doe', email: 'John@gmail.com')

    visit "/users/#{user_1.id}"

    click_button 'Discover Movies'

    fill_in 'movie', with: 'Mission Impossible'

    click_button 'Search'
    expect(current_path).to eq("/users/#{user_1.id}/movies")

    expect(page).to have_content('Mission Impossible')
  end

  it "clicks the 'Discover Movies' and then 'Top Movies' button and is taken to a page with top 40 movie results", :vcr do
    user_1 = User.create(name: 'John Doe', email: 'John@gmail.com')

    visit "/users/#{user_1.id}"

    click_button 'Discover Movies'

    click_button 'Top Movies'

    expect(current_path).to eq("/users/#{user_1.id}/movies")

    expect(page).to have_content('Shawshank Redemption')
  end

  it 'shows the parties the user is hosting', :vcr do
      user_1 = User.create(name: 'John Doe', email: 'John@gmail.com')
      user_2 = User.create(name: 'Cory Doe', email: 'Cory@gmail.com')
      party_1 = Party.create!(date: Date.today, start_time: '20:00:00', movie_id: 278, title: "The Shawshank Redemption", poster: "/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg" )
      user_viewing_party_1 = UserParty.create!(user_id: user_1.id, party_id: party_1.id, host: true)
      user_viewing_party_2 = UserParty.create!(user_id: user_2.id, party_id: party_1.id, host: false)

      visit "/users/#{user_1.id}"

      expect(page).to have_content("You are hosting these parties:")
      expect(page).to have_content(party_1.id)
      expect(page).to have_content(party_1.date)
      expect(page).to have_content(party_1.start_time)
      expect(page).to have_content("The Shawshank Redemption")
      expect(page.html).to include("https://image.tmdb.org/t/p/w200/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg")
    end

end
