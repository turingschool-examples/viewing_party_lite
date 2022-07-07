require 'rails_helper'

RSpec.describe 'user dashboard page' do
  it 'has users name' do
    user = User.create!(name: 'Tommy Tanktop', email: 'tanktoptitan@aol.com')

    visit "/users/#{user.id}"

    expect(page).to have_content("Tommy Tanktop's Dashboard")
  end

  it 'has a button to discover movies' do
    user = User.create!(name: 'Tommy Tanktop', email: 'tanktoptitan@aol.com')

    visit "/users/#{user.id}"

    expect(page).to have_button('Discover Movies')
  end

  it 'has a section that lists viewing parties' do
    user = User.create!(name: 'Tommy Tanktop', email: 'tanktoptitan@aol.com')

    Party.create!(movie_name: 'Fight Club', movie_id: 1, date: Time.now.strftime('%d/%m/%Y'),
                  start_time: Time.now.strftime('%H:%M'), duration: 120)
    Party.create!(movie_name: 'Fight Club 2', movie_id: 1,
                  date: Time.now.strftime('%d/%m/%Y'), start_time: Time.now.strftime('%H:%M'), duration: 120)
    Party.create!(movie_name: 'Fight Club 3', movie_id: 1, date: Time.now.strftime('%d/%m/%Y'),
                  start_time: Time.now.strftime('%H:%M'), duration: 120)

    visit "/users/#{user.id}"

    within '#viewingParties' do
      expect(page).to have_content('Fight Club')
      expect(page).to have_content('Fight Club 2')
      expect(page).to have_content('Fight Club 3')
    end
  end
end
