# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Dashboard' do
  before :each do
    @eli = User.create!(name: 'Eli', email: 'es@g')
    @sunny = User.create!(name: 'Sunny', email: 'sm@g')

    @frozen = Party.create!(movie_id: 1, start_time: '2022-12-25 06:30:00 UTC', duration: 90)
    @moana = Party.create!(movie_id: 2, start_time: '2022-12-31 12:00:00 UTC', duration: 120)

    PartyUser.create!(party: @frozen, user: @eli, host: true)
    PartyUser.create!(party: @frozen, user: @sunny, host: false)
    PartyUser.create!(party: @moana, user: @sunny, host: true)
    PartyUser.create!(party: @moana, user: @eli, host: false)

    visit "/users/#{@eli.id}"
  end

  it 'has heading' do
    expect(page).to have_content("Eli's Dashboard")
    expect(page).to_not have_content("Sunny's Dashboard")
  end

  it 'has button to discover movies' do
    expect(page).to have_button('Discover Movies')
    click_button 'Discover Movies'
    expect(current_path).to eq("/users/#{@eli.id}/discover")
    expect(page).to have_content('Discover Movies')
  end

  xit 'has invited viewing parties' do
    within '#invited' do
      expect(page).to have_content('MOVIE IMAGE')
      expect(page).to have_content('MOVIE NAME')
      expect(page).to have_content('2022-12-31 12:00:00 UTC')
      expect(page).to have_content('Host: Sunny')
      expect(page).to have_content('Invited: Eli')
      expect(page).to_not have_content('Host: Eli')
      expect(page).to_not have_content('Invited: Sunny')
    end
  end

  xit 'has created viewing parties' do
    within '#created' do
      expect(page).to have_content('MOVIE IMAGE')
      expect(page).to have_content('MOVIE NAME')
      expect(page).to have_content('2022-12-25 06:30:00 UTC')
      expect(page).to have_content('Host: Eli')
      expect(page).to have_content('Invited: Sunny')
      expect(page).to_not have_content('Host: Sunny')
      expect(page).to_not have_content('Invited: Eli')
    end
  end
end
