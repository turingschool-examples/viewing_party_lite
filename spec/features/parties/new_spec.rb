require 'rails_helper'

RSpec.describe "New Viewing Party", type: :feature do
  it 'has a form to create new party', :vcr do
    party_count=Party.all.count

    user = User.create!(name: "Tim", email: "Tim@mail.com", password: "password", password_confirmation: "password")
    user2 = User.create!(name: "Tom", email: "Tom@mail.com", password: "password", password_confirmation: "password")

    visit "/"
    click_on "Login"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_on "Login"

    visit "/movies/278/viewing_party/new"

    fill_in "duration", with: 200
    fill_in "date", with: "2023/01/01"
    fill_in "time", with: Time.now.strftime("%I:%M:%S")


    within "#check_box-Tom" do
      page.check("users[]")#all check boxes have the same name
    end
      click_button "submit"

    expect(Party.all.count).to eq(party_count + 1)
    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("Viewing Parties")
  end

  it 'rejects new party of too short a duration', :vcr do
    party_count=Party.all.count

    user = User.create!(name: "Tim", email: "Tim@mail.com", password: "password", password_confirmation: "password")
    user2 = User.create!(name: "Tom", email: "Tom@mail.com", password: "password", password_confirmation: "password")

    visit "/login"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_on "Login"

    visit "/movies/278/viewing_party/new"

    fill_in "duration", with: 4
    fill_in "date", with: "2023/01/01"
    fill_in "time", with: Time.now.strftime("%I:%M:%S")

    within "#check_box-Tom" do
      page.check("users[]")#all check boxes have the same name
    end
    click_button "submit"

    expect(Party.all.count).to eq(party_count)
  end
end
