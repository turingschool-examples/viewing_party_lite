require 'rails_helper'

RSpec.describe "New Viewing Party" do
  it 'has a form to create new party' do
    user1 = User.create!(name: "Michael", email: "Mike@mail.com")
    user2 = User.create!(name: "Jackson", email: "Jacko@mail.com")

    visit "/users/#{user1.id}/movies/45649/viewing_party/new"

    expect(page).to have_field("Duration")
    expect(page).to have_field("Date")
    expect(page).to have_field("Time")
  end

  it 'completed form creates new viewing party' do
    all_parties = Party.all.count
    user1 = User.create!(name: "Michael", email: "Mike@mail.com")
    user2 = User.create!(name: "Jackson", email: "Jacko@mail.com")

    visit "/users/#{user1.id}/movies/45649/viewing_party/new"

    fill_in "Duration", with: 200
    fill_in "Date", with: "2022/08/09"
    fill_in "Time", with: Time.now.strftime
    page.check("users[]")
    click_button "Submit"

    expect(Party.all.count).to eq(all_parties + 1)
  end
end
