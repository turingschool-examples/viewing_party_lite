require 'rails_helper'

RSpec.describe 'movie show page', type: :feature do

  it 'happy path' do
    user = User.create(name: "Jill Jillian", email: "jill@gmail.com")

    visit("users/#{user.id}/movies/75780")
    save_and_open_page

    expect(page).to have_content("Jack Reacher")
    expect(page).to have_content("Rating: 6.6")
    expect(page).to have_content("Runtime: 130 minutes")
    expect(page).to have_content("Genres: Action, Crime, Drama, Thriller")
    expect(page).to have_content("Summary: When a gunman takes five lives with six shots, all evidence points to the suspect in custody.")
    expect(page).to have_content("Tom Cruise - Jack Reacher")
    expect(page).to have_content("This movie has 2 reviews.")
    expect(page).to have_content("Kenneth Axel Carlsson, username: brekkil, rating: 3.0")
    expect(page).to have_content("John Chard, username: John Chard, rating: 8.0")

    expect(page).to have_button("New Viewing Party")
    expect(page).to have_button("Back to Discover")

  end
end
