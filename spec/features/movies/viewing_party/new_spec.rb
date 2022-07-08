require 'rails_helper'

RSpec.describe "New Party Page" do
  it 'creates a new viewing party' do
    user = User.create(name: 'Drewb', email: 'Drew@testemail.com')
    movie =
    party_count = Party.all.length
    visit "/users/#{user.id}/movies/#{movie.id}/viewing-party/new"
    fill_in "Duration", with: '200'
    fill_in "Date", with: "12/21/2112"
    click_button "Submit"
    expect(Party.all.length).to eq(party_count+1)
  end
end
