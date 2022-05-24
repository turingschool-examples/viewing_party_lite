require 'rails_helper'

RSpec.describe 'User dahsboard:', type: :feature do
  before(:each) do
    @user1 = User.create!(name: "Bliffert Blankship", email: "Bliff@aol.com", password: "12345", password_confirmation: "12345")
    @user2 = User.create!(name: "Blankert Bliffship", email: "Blank@aol.com", password: "12345", password_confirmation: "12345" )
    @the_dark_knight = Party.create!(duration: 66, date: "01/12/13", start: "14:00", movie_id: 155)
    @user_party = UserParty.create!(user_id: @user1.id, party_id: @the_dark_knight.id)

    visit '/login'
    fill_in("name", with: @user1.name)
    fill_in("email", with: @user1.email)
    fill_in("Password", with: @user1.password)
    click_button("Log in")

  end

  it "has stuff on the page" do
    expect(page).to have_content("#{@user1.name}'s Magical dashboard")
    expect(page).to_not have_content("#{@user2.name}'s Magical dashboard")
    expect(page).to have_button("Discover Movies")
    expect(page).to have_content("Viewing Parties")
  end

  it "has viewing parties user has created" do
    visit "/users/dashboard?=#{@user1.email}"

    within("#viewing-parties") do
      expect(page).to have_content(@the_dark_knight.date)
      expect(page).to have_content(@the_dark_knight.start)
      expect(page).to have_content(@user1.name)
      expect(page).to_not have_content(@user2.name)
    end
  end

  it "has viewing parties user is invited to" do
    visit "/users/dashboard?=#{@user1.email}"

    within("#viewing-parties") do
      expect(page).to have_content(@the_dark_knight.date)
      expect(page).to have_content(@the_dark_knight.start)
      expect(page).to have_content(@user1.name)
      expect(page).to_not have_content(@user2.name)
    end
  end
end
