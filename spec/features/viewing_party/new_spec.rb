require 'rails_helper'

RSpec.describe 'viewing party new form' do
  let!(:user_1) {User.create!(name: "Alfred", email: "alfred@butler.net", status: 0)}
  let!(:user_2) {User.create!(name: "Bruce", email: "bruced@boss.net", status: 0)}
  let!(:user_3) {User.create!(name: "Oswald", email: "oswald@cobblepot.gotham", status: 0)}
  let!(:user_4) {User.create!(name: "Joker", email: "badman@takeover.edu", status: 0)}

  it 'has a button that takes the user back to the discover page' do 
    movie = TmdbFacade.details(278)

    visit new_user_movie_viewing_party_path(user_1, movie.id)

    click_button "Discover Movies"

    expect(current_path).to eq(user_discover_index_path(user_1))
  end

  it 'has a prepopulated form that can be edited to create a new viewing party' do 
    movie = TmdbFacade.details(278)

    visit new_user_movie_viewing_party_path(user_1, movie.id)
    
    expect(page).to have_content("Create a Movie Party for #{movie.title}")
    expect(page).to have_content(movie.title)

    expect(page).to have_content(user_2.name)
    expect(page).to have_content(user_2.email)
    expect(page).to have_content(user_3.name)
    expect(page).to have_content(user_3.email)
    expect(page).to have_content(user_4.name)
    expect(page).to have_content(user_4.email)

    expect(page).to have_field(:duration_of_party, with: movie.total_min)
    expect(page).to have_field(:day, with: Date.today)
    expect(page).to have_field(:start_time, with: "7:00")

    fill_in :start_time, with: "8:00"

    check "#{user_4.name} (#{user_4.email})"
    click_button "Create Party"

    expect(current_path).to eq(user_path(user_1.id))
  end
end