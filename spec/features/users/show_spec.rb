# frozen_string_literal: true

require 'rails_helper'

describe 'user show page (dashboard)' do
  before do
    @user1 = User.create!(name: 'Jane', email: 'eleven@upsidedown.com')
    @user2 = User.create!(name: 'Dustin', email: 'hellfire@hawkins.edu')
  end
  it 'displays the users name' do
    visit user_path(@user1)
    expect(page).to have_content("Jane's Dashboard")
    expect(page).to_not have_content("Dustin's Dashboard")
  end

  it 'has a button to link to the users movie discover page' do
    visit user_path(@user1)
    click_button('Discover Movies')

    expect(current_path).to eq("/users/#{@user1.id}/discover")
  end

  it 'has a section to display the users viewing parties' do
    party1 = ViewingParty.create!(date: Date.today, start_time: Time.now, duration: 180, movie_id: 120)
    party2 = ViewingParty.create!(date: Date.today, start_time: Time.now, duration: 80, movie_id: 1362)
    
    user_party1 = UserViewingParty.create!(user: @user1, viewing_party: party1, hosting: true)
    user_party2 = UserViewingParty.create!(user: @user2, viewing_party: party1, hosting: false)

    user_party3 = UserViewingParty.create!(user: @user1, viewing_party: party2, hosting: false)
    user_party4 = UserViewingParty.create!(user: @user2, viewing_party: party2, hosting: true)
    
    visit user_path(@user1)
  end
end