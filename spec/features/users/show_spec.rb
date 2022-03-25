# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Show Page' do
  it "displays User's Dashboard at top of page" do
    user1 = User.create(name: 'Asil Rolyat', email: 'asil.rolyat@yourmom.com')

    visit "/users/#{user1.id}"

    expect(page).to have_content("#{user1.name}'s Dashboard")
  end

  it 'has a button of discovery' do
    user1 = User.create(name: 'Asil Rolyat', email: 'asil.rolyat@yourmom.com')

    visit "/users/#{user1.id}"

    expect(page).to have_button 'Discover Movies'
  end

  it 'has a section to list viewing parties' do
    user1 = User.create(name: 'Asil Rolyat', email: 'asil.rolyat@yourmom.com')
    party1 = Party.create(duration: 400, date: Date.today, start_time: Time.now.utc)
    party_user1 = PartyUser.create(user_id: user1.id, party_id: party1.id)

    visit "/users/#{user1.id}"

    expect(page).to have_content('Viewing Parties')
    expect(page).to have_content(party1.date.to_s)
  end

  it 'has a button of discovery' do
    user1 = User.create(name: 'Asil Rolyat', email: 'asil.rolyat@yourmom.com')

    visit "/users/#{user1.id}"

    click_button 'Discover Movies'
    expect(current_path).to eq("/users/#{user1.id}/discover")
  end
end
