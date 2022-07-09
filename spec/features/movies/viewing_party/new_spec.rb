require 'rails_helper'

RSpec.describe "New Party Page" do
  it 'creates a new viewing party', :vcr do
    user = User.create(name: 'Drewb', email: 'Drew@testemail.com')
    user2 = User.create(name: 'Alex', email: 'Alex@testemail.com')
    user3 = User.create(name: 'Geddy', email: 'Geddy@testemail.com')
    party_count = Party.all.length

    visit "/users/#{user.id}/movies/278"
    click_button "Create Viewing Party"

    fill_in "Duration", with: '200'
    fill_in "Start time", with: "2022-12-21 21:12:00"
    check("Alex")
    check("Geddy")
    click_button "Submit"

    expect(Party.all.length).to eq(party_count+1)
  end
end
